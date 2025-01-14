# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `mysql2` gem.
# Please instead update this file by running `bin/tapioca gem mysql2`.

# typed: true

module Mysql2; end

class Mysql2::Client
  def initialize(opts = T.unsafe(nil)); end

  def abandon_results!; end
  def affected_rows; end
  def async_result; end
  def automatic_close=(_arg0); end
  def automatic_close?; end
  def close; end
  def closed?; end
  def encoding; end
  def escape(_arg0); end
  def info; end
  def last_id; end
  def more_results?; end
  def next_result; end
  def parse_connect_attrs(conn_attrs); end
  def parse_flags_array(flags, initial = T.unsafe(nil)); end
  def parse_ssl_mode(mode); end
  def ping; end
  def prepare(_arg0); end
  def query(*args, &blk); end
  def query_info; end
  def query_info_string; end
  def query_options; end
  def query_without_profiling(sql, options = T.unsafe(nil)); end
  def read_timeout; end
  def reconnect=(_arg0); end
  def select_db(_arg0); end
  def server_info; end
  def set_server_option(_arg0); end
  def socket; end
  def ssl_cipher; end
  def store_result; end
  def thread_id; end
  def warning_count; end

  private

  def _query(_arg0, _arg1); end
  def charset_name=(_arg0); end
  def connect(_arg0, _arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7); end
  def connect_timeout=(_arg0); end
  def default_auth=(_arg0); end
  def default_file=(_arg0); end
  def default_group=(_arg0); end
  def enable_cleartext_plugin=(_arg0); end
  def init_command=(_arg0); end
  def initialize_ext; end
  def local_infile=(_arg0); end
  def read_timeout=(_arg0); end
  def secure_auth=(_arg0); end
  def ssl_mode=(_arg0); end
  def ssl_set(_arg0, _arg1, _arg2, _arg3, _arg4); end
  def write_timeout=(_arg0); end

  class << self
    def default_query_options; end
    def escape(_arg0); end
    def info; end

    private

    def local_offset; end
  end
end

Mysql2::Client::ALL_FLAGS = T.let(T.unsafe(nil), Integer)
Mysql2::Client::BASIC_FLAGS = T.let(T.unsafe(nil), Integer)
Mysql2::Client::COMPRESS = T.let(T.unsafe(nil), Integer)
Mysql2::Client::CONNECT_ATTRS = T.let(T.unsafe(nil), Integer)
Mysql2::Client::CONNECT_WITH_DB = T.let(T.unsafe(nil), Integer)
Mysql2::Client::FOUND_ROWS = T.let(T.unsafe(nil), Integer)
Mysql2::Client::IGNORE_SIGPIPE = T.let(T.unsafe(nil), Integer)
Mysql2::Client::IGNORE_SPACE = T.let(T.unsafe(nil), Integer)
Mysql2::Client::INTERACTIVE = T.let(T.unsafe(nil), Integer)
Mysql2::Client::LOCAL_FILES = T.let(T.unsafe(nil), Integer)
Mysql2::Client::LONG_FLAG = T.let(T.unsafe(nil), Integer)
Mysql2::Client::LONG_PASSWORD = T.let(T.unsafe(nil), Integer)
Mysql2::Client::MULTI_STATEMENTS = T.let(T.unsafe(nil), Integer)
Mysql2::Client::NO_SCHEMA = T.let(T.unsafe(nil), Integer)
Mysql2::Client::ODBC = T.let(T.unsafe(nil), Integer)
Mysql2::Client::OPTION_MULTI_STATEMENTS_OFF = T.let(T.unsafe(nil), Integer)
Mysql2::Client::OPTION_MULTI_STATEMENTS_ON = T.let(T.unsafe(nil), Integer)
Mysql2::Client::PROTOCOL_41 = T.let(T.unsafe(nil), Integer)
Mysql2::Client::PS_MULTI_RESULTS = T.let(T.unsafe(nil), Integer)
Mysql2::Client::REMEMBER_OPTIONS = T.let(T.unsafe(nil), Integer)
Mysql2::Client::RESERVED = T.let(T.unsafe(nil), Integer)
Mysql2::Client::SECURE_CONNECTION = T.let(T.unsafe(nil), Integer)
Mysql2::Client::SSL = T.let(T.unsafe(nil), Integer)
Mysql2::Client::SSL_MODE_DISABLED = T.let(T.unsafe(nil), Integer)
Mysql2::Client::SSL_MODE_PREFERRED = T.let(T.unsafe(nil), Integer)
Mysql2::Client::SSL_MODE_REQUIRED = T.let(T.unsafe(nil), Integer)
Mysql2::Client::SSL_MODE_VERIFY_CA = T.let(T.unsafe(nil), Integer)
Mysql2::Client::SSL_MODE_VERIFY_IDENTITY = T.let(T.unsafe(nil), Integer)
Mysql2::Client::SSL_VERIFY_SERVER_CERT = T.let(T.unsafe(nil), Integer)
Mysql2::Client::TRANSACTIONS = T.let(T.unsafe(nil), Integer)

class Mysql2::Error < ::StandardError
  def initialize(msg, server_version = T.unsafe(nil), error_number = T.unsafe(nil), sql_state = T.unsafe(nil)); end

  def errno; end
  def error; end
  def error_number; end
  def sql_state; end

  private

  def clean_message(message); end

  class << self
    def new_with_args(msg, server_version, error_number, sql_state); end
  end
end

Mysql2::Error::CODES = T.let(T.unsafe(nil), Hash)
class Mysql2::Error::ConnectionError < ::Mysql2::Error; end
Mysql2::Error::ENCODE_OPTS = T.let(T.unsafe(nil), Hash)
class Mysql2::Error::TimeoutError < ::Mysql2::Error; end

class Mysql2::Field < ::Struct
  def name; end
  def name=(_); end
  def type; end
  def type=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

class Mysql2::Result
  include ::Enumerable

  def count; end
  def each(*args, &blk); end
  def each_without_profiling(*_arg0); end
  def fields; end
  def free; end
  def server_flags; end
  def size; end
end

class Mysql2::Statement
  include ::Enumerable

  def _execute(*_arg0); end
  def affected_rows; end
  def close; end
  def execute(*args, **kwargs); end
  def field_count; end
  def fields; end
  def last_id; end
  def param_count; end
end

module Mysql2::Util
  class << self
    def key_hash_as_symbols(hash); end
  end
end

Mysql2::Util::TIMEOUT_ERROR_CLASS = Timeout::Error
Mysql2::VERSION = T.let(T.unsafe(nil), String)
