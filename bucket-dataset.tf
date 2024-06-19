resource "aws_s3_bucket" "bucket" {
  bucket = "dataset-frutas-verduras-17062024"
  tags = {
    Name      = "Dataset"
    Enviroment = "Dev"
  }
}
