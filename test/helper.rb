require 'test/unit'
require File.expand_path('../../lib/madrox', __FILE__)
Madrox.require_lib :grit_repo

class MadroxTest < Test::Unit::TestCase
  def fork_git_fixture(name, dest = :test)
    old_path = File.join(File.dirname(__FILE__), "fixtures/#{name}.git")
    new_path = File.join(File.dirname(__FILE__), "#{dest}.git")
    repo = Grit::Repo.new(old_path).fork_bare(new_path)
    Madrox::Repo.with_grit(repo.path)
  end

  def clear_git_fixtures(*fixtures)
    (fixtures << :test).each do |name|
      FileUtils.rm_rf File.join(File.dirname(__FILE__), "#{name}.git")
    end
  end

  def default_test
  end
end
