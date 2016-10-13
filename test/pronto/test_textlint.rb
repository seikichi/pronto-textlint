# coding: utf-8

class TestTextlint < Test::Unit::TestCase
  test '#run returns empty array when patches are nil' do
    runner = Pronto::Textlint.new(nil)
    assert_equal([], runner.run)
  end

  test '#run returns empty array when no patches' do
    runner = Pronto::Textlint.new([])
    assert_equal([], runner.run)
  end

  test '#run ignores not added files' do
    patch = Pronto::Git::Patch.new
    mock(patch).additions { 0 }

    runner = Pronto::Textlint.new([patch])
    assert_equal([], runner.run)
  end
end
