defmodule Atlas.Database.FieldNormalizer do

  def normalize_values(values) do
    Enum.map values, normalize_value(&1)
  end

  def normalize_value(:null), do: nil
  def normalize_value("t"), do: true
  def normalize_value("f"), do: false
  def normalize_value(timestamp = {{_, _, _}, {_, _, _}}), do: timestamp
  def normalize_value(value), do: to_binary(value)

  def denormalize_value(nil), do: :null
  def denormalize_value(true), do: "t"
  def denormalize_value(false), do: "f"
  def denormalize_value(value), do: value
end