using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
/// <summary>
/// Summary description for ImageProcess
/// </summary>
public class ImageProcess
{
    public ImageProcess()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public static Bitmap CreateThumbnail(string lcFilename, int lnWidth, int lnHeight)
    {

        System.Drawing.Bitmap bmpOut = null;
        try
        {
            Bitmap loBMP = new Bitmap(lcFilename);
            ImageFormat loFormat = loBMP.RawFormat;
            decimal lnRatio;
            int lnNewWidth = 0;
            int lnNewHeight = 0;
            //*** If the image is smaller than a thumbnail just return it
            if (loBMP.Width < lnWidth && loBMP.Height < lnHeight)
                return loBMP;
            if (loBMP.Width > loBMP.Height)
            {
                lnRatio = (decimal)lnWidth / loBMP.Width;
                lnNewWidth = lnWidth;
                decimal lnTemp = loBMP.Height * lnRatio;
                lnNewHeight = (int)lnTemp;
            }
            else
            {
                lnRatio = (decimal)lnHeight / loBMP.Height;
                lnNewHeight = lnHeight;
                decimal lnTemp = loBMP.Width * lnRatio;
                lnNewWidth = (int)lnTemp;
            }

            bmpOut = new Bitmap(lnNewWidth, lnNewHeight);
            Graphics g = Graphics.FromImage(bmpOut);
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
            g.FillRectangle(Brushes.White, 0, 0, lnNewWidth, lnNewHeight);
            g.DrawImage(loBMP, 0, 0, lnNewWidth, lnNewHeight);
            loBMP.Dispose();
        }
        catch
        {
            return null;
        }

        return bmpOut;
    }


    //public string Resize(Stream fileName,int width, int height, string pathToSave)
    //{
    //    try
    //    {
    //        Image imgInput = Image.FromStream(fileName);
    //        Size nSize = new Size(width, height);
    //        Image imgGDI = new Bitmap(imgInput, nSize.Width, nSize.Height);
    //        Graphics grfx = Graphics.FromImage(imgGDI);
    //        grfx.PixelOffsetMode = PixelOffsetMode.HighQuality;
    //        grfx.DrawImage(imgInput, new Rectangle(new Point(0, 0), nSize), new Rectangle(new Point(0,0), imgInput.Size),GraphicsUnit.Pixel);
    //        grfx.Dispose();
    //        CompressAndSave(imgGDI, pathToSave);
    //        return pathToSave;
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    //public void Crop(Stream fileName, int width, int height, string pathToSave)
    //{
    //    try
    //    {
    //        Image img = Image.FromStream(fileName);
    //        Size nSize = new Size(width, height);
    //        Bitmap bmpImg = new Bitmap(img);

    //        Point point = new Point();
    //        decimal xDiff = (img.Width - width) / 2;
    //        decimal yDiff = (img.Height - height) / 2;
    //        int x = (int)Math.Floor(xDiff);
    //        int y = (int)Math.Floor(yDiff);
    //        Rectangle recArea = new Rectangle(x, y, width, height);
    //        Bitmap bmpCrop = bmpImg.Clone(recArea, bmpImg.PixelFormat);




    //        //bmpCrop.Save(pathToSave);
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}


    //#region Common Methods

    //private void CompressAndSave(Image imgFile, string destination)
    //{

    //    EncoderParameter qualityParam = new EncoderParameter(Encoder.Quality, 100L);
    //    ImageCodecInfo jpegCodec = this.getEncoderInfo("image/jpeg");
    //    if (jpegCodec == null)
    //        return;
    //    EncoderParameters encoderParams = new EncoderParameters(1);
    //    encoderParams.Param[0] = qualityParam;
    //    imgFile.Save(destination, jpegCodec, encoderParams);
    //}

    //private ImageCodecInfo getEncoderInfo(string mimeType)
    //{
    //    // Get image codecs for all image formats
    //    ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();

    //    // Find the correct image codec
    //    for (int i = 0; i < codecs.Length; i++)
    //        if (codecs[i].MimeType == mimeType)
    //            return codecs[i];
    //    return null;
    //}

    ////#region Private Methods

    /////// <summary>
    /////// Converts Bitmap to array. Supports only Format32bppArgb pixel format.
    /////// </summary>
    /////// <param name="bmp">Bitmap to convert.</param>
    /////// <returns>Output array.</returns>
    ////private ushort[][,] ConvertBitmapToArray(Bitmap bmp)
    ////{

    ////    ushort[][,] array = new ushort[4][,];

    ////    for (int i = 0; i < 4; i++)
    ////        array[i] = new ushort[bmp.Width, bmp.Height];

    ////    BitmapData bd = bmp.LockBits(new Rectangle(0, 0, bmp.Width, bmp.Height), ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
    ////    int nOffset = (bd.Stride - bd.Width * 4);

    ////    unsafe
    ////    {

    ////        byte* p = (byte*)bd.Scan0;

    ////        for (int y = 0; y < bd.Height; y++)
    ////        {
    ////            for (int x = 0; x < bd.Width; x++)
    ////            {

    ////                array[3][x, y] = (ushort)p[3];
    ////                array[2][x, y] = (ushort)p[2];
    ////                array[1][x, y] = (ushort)p[1];
    ////                array[0][x, y] = (ushort)p[0];

    ////                p += 4;
    ////            }

    ////            p += nOffset;
    ////        }
    ////    }

    ////    bmp.UnlockBits(bd);

    ////    return array;
    ////}

    /////// <summary>
    /////// Converts array to Bitmap. Supports only Format32bppArgb pixel format.
    /////// </summary>
    /////// <param name="array">Array to convert.</param>
    /////// <returns>Output Bitmap.</returns>
    ////private Bitmap ConvertArrayToBitmap(ushort[][,] array)
    ////{

    ////    int width = array[0].GetLength(0);
    ////    int height = array[0].GetLength(1);

    ////    Bitmap bmp = new Bitmap(width, height, PixelFormat.Format32bppArgb);

    ////    BitmapData bd = bmp.LockBits(new Rectangle(0, 0, width, height), ImageLockMode.WriteOnly, PixelFormat.Format32bppArgb);
    ////    int nOffset = (bd.Stride - bd.Width * 4);

    ////    unsafe
    ////    {

    ////        byte* p = (byte*)bd.Scan0;

    ////        for (int y = 0; y < height; y++)
    ////        {
    ////            for (int x = 0; x < width; x++)
    ////            {

    ////                p[3] = (byte)Math.Min(Math.Max(array[3][x, y], Byte.MinValue), Byte.MaxValue);
    ////                p[2] = (byte)Math.Min(Math.Max(array[2][x, y], Byte.MinValue), Byte.MaxValue);
    ////                p[1] = (byte)Math.Min(Math.Max(array[1][x, y], Byte.MinValue), Byte.MaxValue);
    ////                p[0] = (byte)Math.Min(Math.Max(array[0][x, y], Byte.MinValue), Byte.MaxValue);

    ////                p += 4;
    ////            }

    ////            p += nOffset;
    ////        }
    ////    }

    ////    bmp.UnlockBits(bd);

    ////    return bmp;
    ////}

    ////#endregion
    //#endregion

}