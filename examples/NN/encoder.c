/*
 * encoder.c
 * 
 * Created on: Sep 9, 2013
 * 			Author: Amir Yazdanbakhsh <a.yazdanbakhsh@gatech.edu>
 */
//#include "fann.h"
#include "datatype.h"
#include "jpegconfig.h"
#include "prototype.h"
//#include "time.h"
#include "rgbimage.h"
#include "nnconfiguration.h"
#include <math.h>
//#include <stdbool.h>
#include <stdio.h>





UINT8	Lqt [BLOCK_SIZE];
UINT8	Cqt [BLOCK_SIZE];
UINT16	ILqt [BLOCK_SIZE];
UINT16	ICqt [BLOCK_SIZE];

INT16	Y1 [BLOCK_SIZE];
INT16	Y2 [BLOCK_SIZE];
INT16	Y3 [BLOCK_SIZE];
INT16	Y4 [BLOCK_SIZE];
INT16	CB [BLOCK_SIZE];
INT16	CR [BLOCK_SIZE];
INT16	Temp [BLOCK_SIZE];
UINT32 lcode = 0;
UINT16 bitindex = 0;

INT16 global_ldc1;
INT16 global_ldc2;
INT16 global_ldc3;

	float dataIn [BLOCK_SIZE + 1];
	float dataOut[BLOCK_SIZE];
	float layer2[32];
	float layer3[63];



int encodeImage(
	RgbImage* srcImage,
	UINT8 outputBuffer[],
	UINT32 qualityFactor,
	UINT32 imageFormat
) {
	

	global_ldc1 = 0;
	global_ldc2 = 0;
	global_ldc3 = 0;




	/** Quantization Table Initialization */
	initQuantizationTables(qualityFactor);



	UINT16 i, j;
	/* Writing Marker Data */
	int k = writeMarkers(outputBuffer, imageFormat, srcImage->w, srcImage->h);

	printf("markers: %d\n",k);
	
	for (i = 0; i < srcImage->h; i += 8) {
		for (j = 0; j < srcImage->w; j += 8) {
			readMcuFromRgbImage(srcImage, j, i, Y1);
			/* Encode the data in MCU */
			//outputBuffer = encodeMcu(imageFormat, outputBuffer);
			k = encodeMcu(imageFormat, outputBuffer, k);
			//printf("encode[%d/%d]: %d\n",i,j,k);
		}
		//printf("execution[%d]: %d\n",i,k);
	}
	//printf("\n%d\n", k);

	//printf("execution: %d\n",k);

	k = closeBitstream(outputBuffer,k);

	//printf("close bitstream: %d\n",k);
	return k;
}


int encodeMcu(UINT32 imageFormat, UINT8 outputBuffer[], int k) 
{
	int i,j;
	levelShift(Y1);
	printf("encodemcu: %d\n",k);


	for (i = 0; i < BLOCK_SIZE; ++i)
	{
		dataIn[i] = Y1[i] / 256.;
	}

	//bool isNN = true;
	


	int q = 0;
	
	dataIn[BLOCK_SIZE] = 1;

	for(i = 0; i < layers[1] - 1; i++)
	{
		layer2[i] = 0;
		for(j = 0; j < layers[0]; j++)
		{
			layer2[i] = layer2[i] + dataIn[j] * layer_one[j + q];
		}
		layer2[i] = layer2[i] * 5.00000000000000000000e-01;
		//float max_s = 150/5.00000000000000000000e-01;
		//if (layer2[i] > max_s) layer2[i] = max_s;
		//else if (layer2[i] < -max_s) layer2[i] = -max_s;
		layer2[i] = (1.0/(1.0 + exp(-2.0 * (layer2[i] /*+ layer_one[64 + 64 * i]*/))));
		q = q + j;
		
	}

	layer2[layers[1]-1] = 1;	


	
	q = 0;
	for(i = 0; i < layers[2] - 1; i++)
	{ 
		layer3[i] = 0;
		for(j = 0; j < layers[1]; j++)
		{//if(j ==layers[1]-1) printf("%f ",layer2[layers[1]-1]);
			layer3[i] = layer3[i] + layer2[j] * layer_two[j + q]; 
		}
		layer3[i] = layer3[i] * 5.00000000000000000000e-01;
		//float max_s = 150/5.00000000000000000000e-01;
		//if (layer3[i] > max_s) layer3[i] = max_s;
		//else if (layer3[i] < -max_s) layer3[i] = -max_s;
		layer3[i] = (2.0/(1.0 + exp(-2.0 * (layer3[i]/* + layer_two[32 + 32* i]*/))) - 1.0f);
		q = q + j;
	}

//printf("\nlayer current: %f", layer3[1]);

	for(i = 0; i < layers[2] - 1; i++)
	{	
		dataOut[i] = layer3[i];
	}


/*original
	dct(Y1);
	quantization(Y1, ILqt);

	for (i = 0; i < BLOCK_SIZE; ++i)
	{
		dataOut[i] = Temp[i] / 256.;
	}
	isNN = false;

**/



	for(i = 0; i < BLOCK_SIZE; ++i)
	{
		Temp[i] = dataOut[i] * 256.0;
	}
	if(1 == 1)
	{
		for(i = 8; i < BLOCK_SIZE; ++i)
		{
			Temp[i] = 0.0;
		}
	}


	k = huffman(1, outputBuffer, k);
	return k;
}
