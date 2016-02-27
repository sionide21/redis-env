require "spec_helper"

describe RedisEnv do
  it "has a version number" do
    expect(RedisEnv::VERSION).not_to be nil
  end
end
