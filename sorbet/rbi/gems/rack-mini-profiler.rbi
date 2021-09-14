# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rack-mini-profiler/all/rack-mini-profiler.rbi
#
# rack-mini-profiler-2.3.3

module Rack
end
class Rack::MiniProfiler
  def advanced_debugging_enabled?; end
  def analyze_memory; end
  def cache_control_value; end
  def call(env); end
  def cancel_auto_inject(env); end
  def config; end
  def current; end
  def current=(c); end
  def dump_env(env); end
  def dump_exceptions(exceptions); end
  def flamegraph(graph, path); end
  def generate_html(page_struct, env, result_json = nil); end
  def get_profile_script(env); end
  def handle_snapshots_request(env); end
  def help(client_settings, env); end
  def ids(env); end
  def ids_comma_separated(env); end
  def initialize(app, config = nil); end
  def inject(fragment, script); end
  def inject_profiler(env, status, headers, body); end
  def make_link(postfix, env); end
  def rails_route_from_path(path, method); end
  def self.add_snapshot_custom_field(key, value); end
  def self.advanced_tools_message; end
  def self.authorize_request; end
  def self.binds_to_params(binds); end
  def self.config; end
  def self.create_current(env = nil, options = nil); end
  def self.current; end
  def self.current=(c); end
  def self.deauthorize_request; end
  def self.discard_results; end
  def self.generate_id; end
  def self.get_snapshot_custom_fields; end
  def self.patch_rails?; end
  def self.redact_sql_queries?; end
  def self.request_authorized?; end
  def self.reset_config; end
  def self.resources_root; end
  def self.share_template; end
  def self.snapshots_transporter?; end
  def self.subscribe_sql_active_record; end
  def self.subscribe_sql_active_record=(arg0); end
  def serve_flamegraph(env); end
  def serve_html(env); end
  def serve_results(env); end
  def take_snapshot(env, start); end
  def take_snapshot?(path); end
  def text_result(body); end
  def tool_disabled_message(client_settings); end
  def trim_strings(strings, max_size); end
  def url_for_snapshot(id); end
  def url_for_snapshots_group(group_name); end
  def user(env); end
end
module Rack::MiniProfiler::TimerStruct
end
class Rack::MiniProfiler::TimerStruct::Base
  def [](name); end
  def []=(name, val); end
  def as_json(options = nil); end
  def attributes; end
  def initialize(attrs = nil); end
  def to_json(*a); end
end
class Rack::MiniProfiler::TimerStruct::Page < Rack::MiniProfiler::TimerStruct::Base
  def as_json(options = nil); end
  def attributes; end
  def attributes_to_serialize; end
  def duration_ms; end
  def duration_ms_in_sql; end
  def extra_json; end
  def initialize(env); end
  def name; end
  def root; end
  def self.from_hash(hash); end
  def self.symbolize_array(array); end
  def self.symbolize_hash(hash); end
  def to_json(*a); end
end
class Rack::MiniProfiler::TimerStruct::Sql < Rack::MiniProfiler::TimerStruct::Base
  def initialize(query, duration_ms, page, parent, params = nil, skip_backtrace = nil, full_backtrace = nil); end
  def parent; end
  def parent=(arg0); end
  def report_reader_duration(elapsed_ms); end
  def trim_binds(binds); end
end
class Rack::MiniProfiler::TimerStruct::Custom < Rack::MiniProfiler::TimerStruct::Base
  def initialize(type, duration_ms, page, parent); end
  def parent; end
  def parent=(arg0); end
end
class Rack::MiniProfiler::TimerStruct::Client < Rack::MiniProfiler::TimerStruct::Base
  def initialize(env = nil); end
  def redirect_count; end
  def self.init_from_form_data(env, page_struct); end
  def self.init_instrumentation; end
  def self.instrument(name, orig); end
  def timings; end
end
class Rack::MiniProfiler::TimerStruct::Request < Rack::MiniProfiler::TimerStruct::Base
  def add_child(name); end
  def add_custom(type, elapsed_ms, page); end
  def add_sql(query, elapsed_ms, page, params = nil, skip_backtrace = nil, full_backtrace = nil); end
  def adjust_depth; end
  def children; end
  def children_duration; end
  def children_duration=(arg0); end
  def custom_timings; end
  def depth; end
  def duration_ms; end
  def duration_ms_in_sql; end
  def initialize(name, page, parent); end
  def move_child(child, destination); end
  def move_custom(type, custom, destination); end
  def move_sql(sql, destination); end
  def name; end
  def parent; end
  def parent=(arg0); end
  def record_time(milliseconds = nil); end
  def self.createRoot(name, page); end
  def sql_timings; end
  def start; end
  def start=(arg0); end
  def start_ms; end
end
class Rack::MiniProfiler::AbstractStore
  def allowed_tokens; end
  def default_snapshot_grouping(snapshot); end
  def diagnostics(user); end
  def fetch_snapshots(batch_size: nil, &blk); end
  def find_snapshots_group(group_name); end
  def get_unviewed_ids(user); end
  def load(id); end
  def load_snapshot(id); end
  def push_snapshot(page_struct, config); end
  def rails_route_from_path(path, method); end
  def save(page_struct); end
  def set_all_unviewed(user, ids); end
  def set_unviewed(user, id); end
  def set_viewed(user, id); end
  def should_take_snapshot?(period); end
  def snapshot_groups_overview; end
end
class Rack::MiniProfiler::MemcacheStore < Rack::MiniProfiler::AbstractStore
  def allowed_tokens; end
  def flush_tokens; end
  def get_unviewed_ids(user); end
  def initialize(args = nil); end
  def load(id); end
  def save(page_struct); end
  def set_all_unviewed(user, ids); end
  def set_unviewed(user, id); end
  def set_viewed(user, id); end
end
class Rack::MiniProfiler::MemoryStore < Rack::MiniProfiler::AbstractStore
  def allowed_tokens; end
  def cleanup_cache; end
  def fetch_snapshots(batch_size: nil, &blk); end
  def get_unviewed_ids(user); end
  def initialize(args = nil); end
  def initialize_cleanup_thread(args = nil); end
  def initialize_locks; end
  def load(id); end
  def load_snapshot(id); end
  def push_snapshot(page_struct, config); end
  def save(page_struct); end
  def set_all_unviewed(user, ids); end
  def set_unviewed(user, id); end
  def set_viewed(user, id); end
  def should_take_snapshot?(period); end
  def wipe_snapshots_data; end
end
class Rack::MiniProfiler::MemoryStore::CacheCleanupThread < Thread
  def cleanup; end
  def cycle_count; end
  def increment_cycle; end
  def initialize(interval, cycle, store); end
  def should_cleanup?; end
  def sleepy_run; end
end
class Rack::MiniProfiler::RedisStore < Rack::MiniProfiler::AbstractStore
  def allowed_tokens; end
  def cached_redis_eval(script, script_sha, reraise: nil, argv: nil, keys: nil); end
  def diagnostics(user); end
  def fetch_snapshots(batch_size: nil, &blk); end
  def flush_tokens; end
  def get_unviewed_ids(user); end
  def initialize(args = nil); end
  def load(id); end
  def load_snapshot(id); end
  def prefix; end
  def prefixed_id(id); end
  def push_snapshot(page_struct, config); end
  def redis; end
  def save(page_struct); end
  def set_all_unviewed(user, ids); end
  def set_unviewed(user, id); end
  def set_viewed(user, id); end
  def should_take_snapshot?(period); end
  def simulate_expire; end
  def snapshot_counter_key; end
  def snapshot_hash_key; end
  def snapshot_zset_key; end
  def user_key(user); end
  def wipe_snapshots_data; end
end
class Rack::MiniProfiler::FileStore < Rack::MiniProfiler::AbstractStore
  def allowed_tokens; end
  def cleanup_cache; end
  def flush_tokens; end
  def get_unviewed_ids(user); end
  def initialize(args = nil); end
  def load(id); end
  def save(page_struct); end
  def set_all_unviewed(user, ids); end
  def set_unviewed(user, id); end
  def set_viewed(user, id); end
end
class Rack::MiniProfiler::FileStore::CacheCleanupThread < Thread
end
class Rack::MiniProfiler::FileStore::FileCache
  def [](key); end
  def []=(key, val); end
  def initialize(path, prefix); end
  def path(key); end
end
class Rack::MiniProfiler::Config
  def assets_url; end
  def assets_url=(lmbda); end
  def authorization_mode; end
  def authorization_mode=(mode); end
  def auto_inject; end
  def auto_inject=(arg0); end
  def backtrace_ignores; end
  def backtrace_ignores=(arg0); end
  def backtrace_includes; end
  def backtrace_includes=(arg0); end
  def backtrace_remove; end
  def backtrace_remove=(arg0); end
  def backtrace_threshold_ms; end
  def backtrace_threshold_ms=(arg0); end
  def base_url_path; end
  def base_url_path=(arg0); end
  def collapse_results; end
  def collapse_results=(arg0); end
  def content_security_policy_nonce; end
  def content_security_policy_nonce=(arg0); end
  def disable_caching; end
  def disable_caching=(arg0); end
  def enable_advanced_debugging_tools; end
  def enable_advanced_debugging_tools=(arg0); end
  def enable_hotwire_turbo_drive_support; end
  def enable_hotwire_turbo_drive_support=(arg0); end
  def enabled; end
  def enabled=(arg0); end
  def flamegraph_mode; end
  def flamegraph_mode=(arg0); end
  def flamegraph_sample_rate; end
  def flamegraph_sample_rate=(arg0); end
  def horizontal_position; end
  def html_container; end
  def html_container=(arg0); end
  def logger; end
  def logger=(arg0); end
  def max_sql_param_length; end
  def max_sql_param_length=(arg0); end
  def max_traces_to_show; end
  def max_traces_to_show=(arg0); end
  def merge!(config); end
  def position; end
  def position=(arg0); end
  def pre_authorize_cb; end
  def pre_authorize_cb=(arg0); end
  def self.attr_accessor(*vars); end
  def self.attributes; end
  def self.default; end
  def show_children; end
  def show_children=(arg0); end
  def show_controls; end
  def show_controls=(arg0); end
  def show_total_sql_count; end
  def show_total_sql_count=(arg0); end
  def show_trivial; end
  def show_trivial=(arg0); end
  def skip_paths; end
  def skip_paths=(arg0); end
  def skip_schema_queries; end
  def skip_schema_queries=(arg0); end
  def skip_sql_param_names; end
  def skip_sql_param_names=(arg0); end
  def snapshot_every_n_requests; end
  def snapshot_every_n_requests=(arg0); end
  def snapshot_hidden_custom_fields; end
  def snapshot_hidden_custom_fields=(arg0); end
  def snapshots_limit; end
  def snapshots_limit=(arg0); end
  def snapshots_redact_sql_queries; end
  def snapshots_redact_sql_queries=(arg0); end
  def snapshots_transport_auth_key; end
  def snapshots_transport_auth_key=(arg0); end
  def snapshots_transport_destination_url; end
  def snapshots_transport_destination_url=(arg0); end
  def snapshots_transport_gzip_requests; end
  def snapshots_transport_gzip_requests=(arg0); end
  def start_hidden; end
  def start_hidden=(arg0); end
  def storage; end
  def storage=(arg0); end
  def storage_failure; end
  def storage_failure=(arg0); end
  def storage_instance; end
  def storage_instance=(arg0); end
  def storage_options; end
  def storage_options=(arg0); end
  def suppress_encoding; end
  def suppress_encoding=(arg0); end
  def toggle_shortcut; end
  def toggle_shortcut=(arg0); end
  def use_existing_jquery; end
  def use_existing_jquery=(arg0); end
  def user_provider; end
  def user_provider=(arg0); end
  def vertical_position; end
end
module Rack::MiniProfiler::ProfilingMethods
  def clean_method_name(method); end
  def counter(type, duration_ms = nil); end
  def counter_method(klass, method, &blk); end
  def finish_step(obj); end
  def profile_method(klass, method, type = nil, &blk); end
  def profile_singleton_method(klass, method, type = nil, &blk); end
  def record_sql(query, elapsed_ms, params = nil); end
  def start_step(name); end
  def step(name, opts = nil); end
  def uncounter_method(klass, method); end
  def unprofile_method(klass, method); end
  def unprofile_singleton_method(klass, method); end
end
class Rack::MiniProfiler::Context
  def current_timer; end
  def current_timer=(arg0); end
  def discard; end
  def discard=(arg0); end
  def full_backtrace; end
  def full_backtrace=(arg0); end
  def initialize(opts = nil); end
  def inject_js; end
  def inject_js=(arg0); end
  def measure; end
  def measure=(arg0); end
  def mpt_init; end
  def mpt_init=(arg0); end
  def page_struct; end
  def page_struct=(arg0); end
  def skip_backtrace; end
  def skip_backtrace=(arg0); end
end
class Rack::MiniProfiler::ClientSettings
  def backtrace_default?; end
  def backtrace_full?; end
  def backtrace_level; end
  def backtrace_level=(arg0); end
  def backtrace_none?; end
  def disable_profiling; end
  def disable_profiling=(arg0); end
  def disable_profiling?; end
  def discard_cookie!(headers); end
  def handle_cookie(result); end
  def has_valid_cookie?; end
  def initialize(env, store, start); end
  def write!(headers); end
end
class Rack::MiniProfiler::GCProfiler
  def analyze_growth(ids_before, ids_after); end
  def analyze_initial_state(ids_before); end
  def analyze_strings(ids_before, ids_after); end
  def diff_object_stats(before, after); end
  def initialize; end
  def object_space_stats; end
  def profile_gc(app, env); end
end
class Rack::MiniProfiler::SnapshotsTransporter
  def backoff_delay; end
  def buffer; end
  def flush_buffer; end
  def gzip_requests; end
  def gzip_requests=(arg0); end
  def initialize(config); end
  def max_buffer_size; end
  def max_buffer_size=(arg0); end
  def requests_interval; end
  def self.failed_http_requests_count; end
  def self.successful_http_requests_count; end
  def self.transport(snapshot); end
  def self.transported_snapshots_count; end
  def ship(snapshot); end
  def start_thread; end
end
class Mysql2::Result
  def each_without_profiling(*arg0); end
end
class Mysql2::Client
  def query_without_profiling(sql, options = nil); end
end
class SqlPatches
  def self.all_patch_files; end
  def self.correct_version?(required_version, klass); end
  def self.elapsed_time(start_time); end
  def self.other_patches; end
  def self.patch(patch_files = nil); end
  def self.patch_rails?; end
  def self.record_sql(statement, parameters = nil, &block); end
  def self.should_measure?; end
  def self.sql_patches; end
end
class Net::HTTP < Net::Protocol
  def request_with_mini_profiler(*args, &block); end
  def request_without_mini_profiler(req, body = nil, &block); end
end
module Rack::MiniProfilerRailsMethods
  def get_webpacker_assets_path; end
  def render_notification_handler(name, finish, start, name_as_description: nil); end
  def should_measure?; end
  def should_move?(child, node); end
  extend Rack::MiniProfilerRailsMethods
end
module Rack::MiniProfilerRails
  def self.create_engine; end
  def self.get_key(payload); end
  def self.initialize!(app); end
  def self.serves_static_assets?(app); end
  def self.shorten_identifier(identifier); end
  def self.subscribe(event, &blk); end
  extend Rack::MiniProfilerRailsMethods
end
class Rack::MiniProfilerRails::Railtie < Rails::Railtie
end
