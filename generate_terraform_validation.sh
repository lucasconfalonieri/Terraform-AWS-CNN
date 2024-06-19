BUCKET_NAME="dataset-frutas-verduras-17062024"
BASE_PATH="Fruits_Vegetables/validation"
OUTPUT_FILE="S3-Validation.tf"
PREFIX="validation/"

echo 'resource "aws_s3_bucket" "bucket" {' > $OUTPUT_FILE
echo '  bucket = "'"$BUCKET_NAME"'"' >> $OUTPUT_FILE
echo '  tags = {' >> $OUTPUT_FILE
echo '    Name      = "Dataset"' >> $OUTPUT_FILE
echo '    Enviroment = "Dev"' >> $OUTPUT_FILE
echo '  }' >> $OUTPUT_FILE
echo '}' >> $OUTPUT_FILE
echo '' >> $OUTPUT_FILE

find $BASE_PATH -type f | while read FILE; do
  RELATIVE_PATH=${FILE#$BASE_PATH/}
  RESOURCE_NAME=$(echo "${RELATIVE_PATH%.*}" | tr '/' '_')
  echo 'resource "aws_s3_bucket_object" "'${RESOURCE_NAME}'" {' >> $OUTPUT_FILE
  echo '  bucket = aws_s3_bucket.bucket.bucket' >> $OUTPUT_FILE
  echo '  key    = "'"$PREFIX$RELATIVE_PATH"'"' >> $OUTPUT_FILE
  echo '  source = "'"$FILE"'"' >> $OUTPUT_FILE
  echo '  etag   = filemd5("'"$FILE"'")' >> $OUTPUT_FILE
  echo '}' >> $OUTPUT_FILE
  echo '' >> $OUTPUT_FILE
done


