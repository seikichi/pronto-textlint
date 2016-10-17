require 'pronto'

require 'open3'
require 'shellwords'

module Pronto
  module Textlint
    class Runner < Pronto::Runner
      def run
        return [] unless @patches

        @patches.select(&method(:valid_patch?))
          .flat_map(&method(:inspect))
          .compact
      end

      private

      def textlint_path
        ENV['PRONTO_TEXTLINT_PATH'] || 'textlint'
      end

      def config_path
        ENV['PRONTO_TEXTLINT_CONFIG_PATH'] || '.textlintrc'
      end

      def valid_patch?(patch)
        patch.additions > 0
      end

      def inspect(patch)
        output = run_textlint(patch)
        offences = clean_up_textlint_output(output)

        offences.flat_map do |offence|
          patch.added_lines
            .select { |line| line.new_lineno == offence['line'] }
            .map { |line| new_message(offence, line) }
        end
      end

      def run_textlint(patch)
        Dir.chdir(patch.repo.path) do
          path = patch.new_file_full_path.to_s
          command = "#{textlint_path.shellescape} -f json -c #{config_path} #{path.shellescape}"
          stdout, stderr, = Open3.capture3(command)
          puts "WARN: pronto-textlint: #{stderr}" if stderr && !stderr.empty?

          return [] if stdout.nil?
          JSON.parse(stdout)
        end
      end

      def new_message(offence, line)
        path = line.patch.delta.new_file[:path]
        Message.new(path, line, :warning, offence['message'], nil, self.class)
      end

      def clean_up_textlint_output(output)
        output.flat_map do |offence|
          offence['messages'].map do |message|
            message.merge('path' => offence['filePath'])
          end
        end
      end
    end
  end
end
