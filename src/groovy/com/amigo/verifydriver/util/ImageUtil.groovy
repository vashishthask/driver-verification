package com.amigo.verifydriver.util

import java.awt.image.BufferedImage
import java.awt.image.DataBufferByte
import java.awt.image.WritableRaster

import javax.imageio.ImageIO

import org.apache.commons.io.IOUtils;

class ImageUtil {

	public byte[] extractBytesFromImageInClasspath (String imageName) {
		InputStream stream = this.getClass().getClassLoader().getResourceAsStream(imageName)
		return IOUtils.toByteArray(stream)
	}
}