# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/redis-namespace/all/redis-namespace.rbi
#
# redis-namespace-1.7.0

class Redis
end
class Redis::Namespace
  def _client; end
  def add_namespace(key); end
  def append(*args, &block); end
  def auth(*args, &block); end
  def bgrewriteaof(*args, &block); end
  def bgsave(*args, &block); end
  def bitcount(*args, &block); end
  def bitop(*args, &block); end
  def bitpos(*args, &block); end
  def blpop(*args, &block); end
  def brpop(*args, &block); end
  def brpoplpush(*args, &block); end
  def bzpopmax(*args, &block); end
  def bzpopmin(*args, &block); end
  def call_site; end
  def call_with_namespace(command, *args, &block); end
  def client; end
  def clone_args(arg); end
  def config(*args, &block); end
  def connection; end
  def create_enumerator(&block); end
  def dbsize(*args, &block); end
  def debug(*args, &block); end
  def decr(*args, &block); end
  def decrby(*args, &block); end
  def del(*args, &block); end
  def deprecations?; end
  def discard(*args, &block); end
  def disconnect!(*args, &block); end
  def dump(*args, &block); end
  def echo(*args, &block); end
  def eval(*args); end
  def evalsha(*args, &block); end
  def exec; end
  def exists(*args, &block); end
  def expire(*args, &block); end
  def expireat(*args, &block); end
  def flushall(*args, &block); end
  def flushdb(*args, &block); end
  def full_namespace; end
  def get(*args, &block); end
  def getbit(*args, &block); end
  def getrange(*args, &block); end
  def getset(*args, &block); end
  def hdel(*args, &block); end
  def hexists(*args, &block); end
  def hget(*args, &block); end
  def hgetall(*args, &block); end
  def hincrby(*args, &block); end
  def hincrbyfloat(*args, &block); end
  def hkeys(*args, &block); end
  def hlen(*args, &block); end
  def hmget(*args, &block); end
  def hmset(*args, &block); end
  def hscan(*args, &block); end
  def hscan_each(*args, &block); end
  def hset(*args, &block); end
  def hsetnx(*args, &block); end
  def hvals(*args, &block); end
  def incr(*args, &block); end
  def incrby(*args, &block); end
  def incrbyfloat(*args, &block); end
  def info(*args, &block); end
  def initialize(namespace, options = nil); end
  def inspect; end
  def keys(query = nil); end
  def lastsave(*args, &block); end
  def lindex(*args, &block); end
  def linsert(*args, &block); end
  def llen(*args, &block); end
  def lpop(*args, &block); end
  def lpush(*args, &block); end
  def lpushx(*args, &block); end
  def lrange(*args, &block); end
  def lrem(*args, &block); end
  def lset(*args, &block); end
  def ltrim(*args, &block); end
  def mapped_hmget(*args, &block); end
  def mapped_hmset(*args, &block); end
  def mapped_mget(*args, &block); end
  def mapped_mset(*args, &block); end
  def mapped_msetnx(*args, &block); end
  def method_missing(command, *args, &block); end
  def mget(*args, &block); end
  def monitor(*args, &block); end
  def move(*args, &block); end
  def mset(*args, &block); end
  def msetnx(*args, &block); end
  def multi(&block); end
  def namespace(desired_namespace = nil); end
  def namespace=(arg0); end
  def namespaced_block(command, &block); end
  def object(*args, &block); end
  def persist(*args, &block); end
  def pexpire(*args, &block); end
  def pexpireat(*args, &block); end
  def pfadd(*args, &block); end
  def pfcount(*args, &block); end
  def pfmerge(*args, &block); end
  def ping(*args, &block); end
  def pipelined(&block); end
  def psetex(*args, &block); end
  def psubscribe(*args, &block); end
  def pttl(*args, &block); end
  def publish(*args, &block); end
  def punsubscribe(*args, &block); end
  def quit(*args, &block); end
  def randomkey(*args, &block); end
  def redis; end
  def rem_namespace(key); end
  def rename(*args, &block); end
  def renamenx(*args, &block); end
  def respond_to?(command, include_private = nil); end
  def respond_to_missing?(command, include_all = nil); end
  def restore(*args, &block); end
  def rpop(*args, &block); end
  def rpoplpush(*args, &block); end
  def rpush(*args, &block); end
  def rpushx(*args, &block); end
  def sadd(*args, &block); end
  def save(*args, &block); end
  def scan(*args, &block); end
  def scan_each(*args, &block); end
  def scard(*args, &block); end
  def script(*args, &block); end
  def sdiff(*args, &block); end
  def sdiffstore(*args, &block); end
  def select(*args, &block); end
  def self_respond_to?(*arg0); end
  def set(*args, &block); end
  def setbit(*args, &block); end
  def setex(*args, &block); end
  def setnx(*args, &block); end
  def setrange(*args, &block); end
  def shutdown(*args, &block); end
  def sinter(*args, &block); end
  def sinterstore(*args, &block); end
  def sismember(*args, &block); end
  def slaveof(*args, &block); end
  def smembers(*args, &block); end
  def smove(*args, &block); end
  def sort(*args, &block); end
  def spop(*args, &block); end
  def srandmember(*args, &block); end
  def srem(*args, &block); end
  def sscan(*args, &block); end
  def sscan_each(*args, &block); end
  def strlen(*args, &block); end
  def subscribe(*args, &block); end
  def sunion(*args, &block); end
  def sunionstore(*args, &block); end
  def time(*args, &block); end
  def ttl(*args, &block); end
  def type(key); end
  def unlink(*args, &block); end
  def unsubscribe(*args, &block); end
  def unwatch(*args, &block); end
  def warning; end
  def warning=(arg0); end
  def warning?; end
  def watch(*args, &block); end
  def zadd(*args, &block); end
  def zcard(*args, &block); end
  def zcount(*args, &block); end
  def zincrby(*args, &block); end
  def zinterstore(*args, &block); end
  def zpopmax(*args, &block); end
  def zpopmin(*args, &block); end
  def zrange(*args, &block); end
  def zrangebylex(*args, &block); end
  def zrangebyscore(*args, &block); end
  def zrank(*args, &block); end
  def zrem(*args, &block); end
  def zremrangebylex(*args, &block); end
  def zremrangebyrank(*args, &block); end
  def zremrangebyscore(*args, &block); end
  def zrevrange(*args, &block); end
  def zrevrangebylex(*args, &block); end
  def zrevrangebyscore(*args, &block); end
  def zrevrank(*args, &block); end
  def zscan(*args, &block); end
  def zscan_each(*args, &block); end
  def zscore(*args, &block); end
  def zunionstore(*args, &block); end
end
