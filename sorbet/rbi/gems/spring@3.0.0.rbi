# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `spring` gem.
# Please instead update this file by running `bin/tapioca gem spring`.

# typed: true

module Spring
  class << self
    def after_fork(&block); end
    def after_fork_callbacks; end
    def application_root; end
    def application_root=(_arg0); end
    def application_root_path; end
    def command(name); end
    def command?(name); end
    def commands; end
    def gemfile; end
    def project_root_path; end
    def quiet; end
    def quiet=(_arg0); end
    def register_command(name, command = T.unsafe(nil)); end
    def verify_environment; end
    def watch(*items); end
    def watch_interval; end
    def watch_interval=(_arg0); end
    def watch_method; end
    def watch_method=(method); end
    def watcher; end
    def watcher=(_arg0); end

    private

    def find_project_root(current_dir); end
  end
end

class Spring::ClientError < ::StandardError; end
class Spring::CommandNotFound < ::Spring::ClientError; end

class Spring::CommandWrapper
  def initialize(name, command = T.unsafe(nil)); end

  def binstub; end
  def binstub_name; end
  def call; end
  def command; end
  def description; end
  def env(args); end
  def exec; end
  def exec_name; end
  def gem_name; end
  def name; end
  def setup; end
  def setup?; end
end

module Spring::Commands; end

class Spring::Commands::Rails
  def call; end
  def description; end
end

class Spring::Commands::RailsConsole < ::Spring::Commands::Rails
  def command_name; end
  def env(args); end
end

class Spring::Commands::RailsDestroy < ::Spring::Commands::Rails
  def command_name; end
end

class Spring::Commands::RailsGenerate < ::Spring::Commands::Rails
  def command_name; end
end

class Spring::Commands::RailsRunner < ::Spring::Commands::Rails
  def call; end
  def command_name; end
  def env(args); end
  def extract_environment(args); end
end

class Spring::Commands::RailsTest < ::Spring::Commands::Rails
  def command_name; end
  def env(args); end
end

class Spring::Commands::Rake
  def env(args); end

  class << self
    def environment_matchers; end
    def environment_matchers=(_arg0); end
  end
end

class Spring::MissingApplication < ::Spring::ClientError
  def initialize(project_root); end

  def message; end
  def project_root; end
end

class Spring::UnknownProject < ::StandardError
  def initialize(current_dir); end

  def current_dir; end
  def message; end
end

module Spring::Watcher; end

class Spring::Watcher::Abstract
  include ::Mutex_m

  def initialize(root, latency); end

  def add(*items); end
  def debug; end
  def directories; end
  def files; end
  def latency; end
  def lock; end
  def locked?; end
  def mark_stale; end
  def on_debug(&block); end
  def on_stale(&block); end
  def restart; end
  def root; end
  def stale?; end
  def start; end
  def stop; end
  def subjects_changed; end
  def synchronize(&block); end
  def try_lock; end
  def unlock; end
end

class Spring::Watcher::Polling < ::Spring::Watcher::Abstract
  def initialize(root, latency); end

  def add(*_arg0); end
  def check_stale; end
  def mtime; end
  def running?; end
  def start; end
  def stop; end
  def subjects_changed; end

  private

  def compute_mtime; end
  def expanded_files; end
end
