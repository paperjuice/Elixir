defmodule KV.BucketTest do
    use ExUnit.Case, async: true

    setup do
        {:ok, bucket} = KV.Bucket.start_link
        {:ok, bucket: bucket}
    end

    test "store values by key", %{bucket: bucket}, do: assert KV.Bucket.get(bucket, "milk") == nil

    test "check if new value is added", %{bucket: bucket} do
        KV.Bucket.insert_data(bucket, "milk", 3)
        assert KV.Bucket.get(bucket, "milk") == 3
    end

    test "check if value removed", %{bucket: bucket} do
        KV.Bucket.insert_data(bucket, 2, "test")
        KV.Bucket.delete(bucket, 2)
        assert KV.Bucket.get(bucket, 2) == nil
    end

    test "get2 should return empty map", %{bucket: bucket} do
        assert KV.Bucket.get2(bucket) == %{}
    end

end
    