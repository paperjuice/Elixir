defmodule KV.Bucket do
    
    def start_link do
        Agent.start_link(fn -> %{} end)
    end

    def insert_data(bucket, key, value) do
        Agent.update(bucket, &Map.put(&1, key, value))
    end

    def get(bucket, key) do
        Agent.get(bucket, &Map.get(&1, key))
    end

    def get2(bucket) do
        Agent.get(bucket, fn %{}-> %{} end)
    end

    def delete(bucket, key) do
        Agent.get_and_update(bucket, &Map.pop(&1, key))
    end

end