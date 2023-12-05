resource "aws_dynamodb_table" "lights" {
  name           = "table-for-lights-app"
  hash_key       = "id"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "id"
    type = "N"
  }

  tags = {
    Name = "dynamo-db-lights"
  }
}

resource "aws_dynamodb_table" "heating" {
  name           = "heating"
  hash_key       = "id"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "id"
    type = "N"
  }

  tags = {
    Name = "dynamo-db-heating"
  }
}
