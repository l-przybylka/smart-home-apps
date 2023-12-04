resource "aws_dynamodb_table" "lights" {
  name           = "table-for-lights-app"
  hash_key       = "id"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "id"
    type = "N"
  }

  attribute {
    name = "Location"
    type = "S"
  }

  attribute {
    name = "Status"
    type = "B"
  }

  global_secondary_index {
    name               = "LocationIndex"
    hash_key           = "Location"
    range_key          = "Status"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  tags = {
    Name = "dynamo-db-lights"
  }
}
