require 'helper'

class TestHooks < MiniTest::Unit::TestCase
  attr_reader :hook, :opts, :project_path

  def setup
    @opts = {}
    opts[:message] = "quux"
    opts[:author]  = "foo"
    opts[:sha]     = "0000000000000000000000000000000000000000"
    opts[:output]  = "bar"

    @project_path  = File.dirname(__FILE__) + '/dummy'
    @hook          = CIJoe::Hook
  end

  def test_empty_output_with_not_existing_folder
    output = hook.run('build-worked', '/foo/bar', opts)
    assert_equal nil, output
  end

  def test_empty_output_with_not_existing_hook
    output = hook.run('foobar', project_path, opts)
    assert_equal nil, output
  end

  # PENDING
  # def test_empty_hook_env
  #   opts = {}
  #   output = hook.run('build-worked', project_path, opts)
  #    assert_equal \
  #     "Author: \n" \
  #     "SHA: \n" \
  #     "Message: \n" \
  #     "OUTPUT: \n", output
  # end

  # def test_run_hook
  #   output = hook.run('build-worked', project_path, opts)
  #   assert_equal \
  #     "Author: foo\n" \
  #     "SHA: 0000000000000000000000000000000000000000\n" \
  #     "Message: quux\n" \
  #     "OUTPUT: bar\n", output
  # end
end