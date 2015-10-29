#define N 64


int ar[N] = {
    -1155484576, -723955400, 1033096058, -1690734402, -1557280266, 1327362106,
    -1930858313, 502539523, -1728529858, -938301587, 1431162155, 1085665355,
    1654374947, -1661998771, -65105105, -73789608, -518907128, 99135751,
    -252332814, 755814641, 1180918287, 1344049776, 553609048, 1580443894,
    629649304, -1266264776, 99807007, 5955764, -1946737912, 39620447,
    -152527805, -1877116806, 448784075, 1086124775, -1609984092, 1227951724,
    1764356251, 64111306, -960731419, -100082026, -39845375, -1339022546,
    2092649110, -568315836, -1089884900, -81839914, -1146103148, -1846688624,
    -784703072, 55004124, -691960657, 1770461755, -2032810463, -1177788003,
    -432352882, -65824064, 575267217, -1949367821, 356750287, 798819494,
    -92022521, 1318001577, -1192467086, -1412716779
};

int ar_original[N] = {
    -1155484576, -723955400, 1033096058, -1690734402, -1557280266, 1327362106,
    -1930858313, 502539523, -1728529858, -938301587, 1431162155, 1085665355,
    1654374947, -1661998771, -65105105, -73789608, -518907128, 99135751,
    -252332814, 755814641, 1180918287, 1344049776, 553609048, 1580443894,
    629649304, -1266264776, 99807007, 5955764, -1946737912, 39620447,
    -152527805, -1877116806, 448784075, 1086124775, -1609984092, 1227951724,
    1764356251, 64111306, -960731419, -100082026, -39845375, -1339022546,
    2092649110, -568315836, -1089884900, -81839914, -1146103148, -1846688624,
    -784703072, 55004124, -691960657, 1770461755, -2032810463, -1177788003,
    -432352882, -65824064, 575267217, -1949367821, 356750287, 798819494,
    -92022521, 1318001577, -1192467086, -1412716779
};

void bubblesort(int* ar, int n) {
	int i,j;
	    int temp;

	    for (i=0;i<n;i++) {
	        for (j=0;j<n-1;j++) {
	            if (ar[j] > ar[j+1]) {
	                temp = ar[j+1];
	                ar[j+1] = ar[j];
	                ar[j] = temp;
	            }
	        }
    }
}

void bubblesort_adapted_mul(int* ar, int n) {
	int i,j;
	    int temp, temp2;

	    //long long int test;
		//int test;
	    int condition;
	    int value, next_value;

	    //int higher, lower, h_valid;

	    for (i=0;i<n;i++) {
	        for (j=0;j<n-1;j++) {
				value = ar[j];
				next_value = ar[j+1];

				asm("cmp %0,%1,%2": "=r" (condition): "r" (next_value), "r" (value)) ;
				condition = condition > 0;
				//test = (long long int)value - (long long int)next_value;
				//test = value - next_value;
/*
				higher = test >> 32;
				h_valid = higher != 0;
				higher = higher > 0;
				lower = (int)test;
				lower = lower > 0;
				condition = higher*h_valid + lower*!h_valid;
*/

				//test = test > 0;
				//condition = (int)test;

				/*
				condition = value - next_value;
				condition = condition > 0;
*/
				temp = next_value*condition | value*!condition;
				temp2 = value*condition | next_value*!condition;

				//temp = next_value*condition + value*!condition;
				//temp2 = value*condition + next_value*!condition;

/*
				test = (long long int)ar[j] - (long long int)ar[j+1];
				test = test > 0;
				condition = (int)test;

				temp = ar[j+1]*condition + ar[j]*!condition;
				temp2 = ar[j]*condition + ar[j+1]*!condition;
*/
	            ar[j+1] = temp2;
	            ar[j] = temp;

	        	/*
	        	if (ar[j] > ar[j+1]) {
	                temp = ar[j+1];
	                ar[j+1] = ar[j];
	                ar[j] = temp;
	            }
	            */
	        }
    }
}

int main() {

	//int i;

	//bubblesort(ar_original, N);
	bubblesort_adapted_mul(ar, N);
/*
	for(i=0; i<N; i++) {
		if(ar[i] != ar_original[i]) {
			while(1);
		}
	}
*/
    return 0;
}
