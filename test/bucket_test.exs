defmodule KV.BucketTest do
  use ExUnit.Case, async: true 

  setup do
    {:ok, bucket} = KV.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "has no value by default", map = %{} do
    %{bucket: bucket} = map
    assert KV.Bucket.get(bucket, "milk")  == nil
  end

  test "check value", %{bucket: bucket} do
    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "check if value is removed", %{bucket: bucket} do
    KV.Bucket.put(bucket, "test", 4)
    KV.Bucket.remove(bucket, "test")
    assert KV.Bucket.get(bucket, "test") == nil
  end
end