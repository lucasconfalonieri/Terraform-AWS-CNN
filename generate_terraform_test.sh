BUCKET_NAME="dataset-frutas-verduras-17062024"
BASE_PATH="Fruits_Vegetables/test"
OUTPUT_FILE="S3-Test.tf"
PREFIX="test/"

find $BASE_PATH -type f | while read FILE; do
  RELATIVE_PATH=${FILE#$BASE_PATH/}
  RESOURCE_NAME=$(echo "${RELATIVE_PATH%.*}" | tr '/' '_')
  echo 'resource "aws_s3_bucket_object" "'test-${RESOURCE_NAME}'" {' >> $OUTPUT_FILE
  echo '  bucket = aws_s3_bucket.bucket.bucket' >> $OUTPUT_FILE
  echo '  key    = "'"$PREFIX$RELATIVE_PATH"'"' >> $OUTPUT_FILE
  echo '  source = "'"$FILE"'"' >> $OUTPUT_FILE
  echo '  etag   = filemd5("'"$FILE"'")' >> $OUTPUT_FILE
  echo '}' >> $OUTPUT_FILE
  echo '' >> $OUTPUT_FILE
done


