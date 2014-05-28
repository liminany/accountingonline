using Amazon.S3;
using Amazon.S3.Model;
using System.IO;

namespace Arabisky.AmazonLayer
{
    public class AmazonS3Handler
    {
        AmazonS3Client _amazonS3Client;
        string _bucketName;

        public AmazonS3Handler(string accessKey, string secretKey,string bucketName)
        {
            _amazonS3Client = new AmazonS3Client(accessKey, secretKey, new AmazonS3Config { ServiceURL = "http://s3-us-west-1.amazonaws.com" });
            _bucketName = bucketName;
        }

        public string PutImage(Stream inputStream, string key)
        {
            PutObjectRequest putRequest = new PutObjectRequest();
            putRequest.BucketName = _bucketName;
            putRequest.Key = key;
            putRequest.InputStream = inputStream;
            return _amazonS3Client.PutObject(putRequest).ETag;
        }
    }
}
