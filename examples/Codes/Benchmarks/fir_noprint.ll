; ModuleID = 'fir_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@fir_int = global [36 x i32] [i32 -2, i32 1, i32 4, i32 3, i32 -2, i32 -4, i32 2, i32 7, i32 0, i32 -9, i32 -4, i32 12, i32 11, i32 -14, i32 -26, i32 15, i32 89, i32 127, i32 89, i32 15, i32 -26, i32 -14, i32 11, i32 12, i32 -4, i32 -9, i32 0, i32 7, i32 2, i32 -4, i32 -2, i32 3, i32 4, i32 1, i32 -2, i32 0], align 4
@in_data = global [701 x i32] [i32 0, i32 0, i32 0, i32 0, i32 127, i32 121, i32 114, i32 121, i32 13, i32 13, i32 0, i32 3, i32 5, i32 2, i32 3, i32 127, i32 127, i32 2, i32 126, i32 0, i32 1, i32 126, i32 1, i32 1, i32 127, i32 0, i32 127, i32 0, i32 2, i32 1, i32 1, i32 3, i32 1, i32 127, i32 1, i32 0, i32 1, i32 1, i32 125, i32 123, i32 115, i32 106, i32 119, i32 16, i32 14, i32 1, i32 5, i32 5, i32 5, i32 5, i32 125, i32 0, i32 2, i32 125, i32 0, i32 0, i32 126, i32 1, i32 126, i32 127, i32 3, i32 124, i32 126, i32 6, i32 0, i32 126, i32 3, i32 2, i32 127, i32 126, i32 127, i32 2, i32 1, i32 127, i32 1, i32 1, i32 0, i32 3, i32 0, i32 127, i32 2, i32 0, i32 127, i32 3, i32 1, i32 0, i32 0, i32 125, i32 0, i32 3, i32 0, i32 126, i32 127, i32 2, i32 1, i32 126, i32 0, i32 3, i32 127, i32 125, i32 1, i32 1, i32 1, i32 127, i32 0, i32 5, i32 0, i32 127, i32 2, i32 126, i32 127, i32 2, i32 1, i32 0, i32 126, i32 0, i32 5, i32 0, i32 127, i32 0, i32 126, i32 1, i32 0, i32 125, i32 1, i32 3, i32 127, i32 0, i32 0, i32 126, i32 2, i32 3, i32 126, i32 125, i32 114, i32 104, i32 113, i32 5, i32 12, i32 7, i32 2, i32 6, i32 13, i32 5, i32 125, i32 3, i32 2, i32 127, i32 0, i32 121, i32 122, i32 3, i32 126, i32 125, i32 0, i32 125, i32 2, i32 1, i32 125, i32 8, i32 3, i32 124, i32 6, i32 0, i32 122, i32 6, i32 2, i32 124, i32 3, i32 126, i32 121, i32 6, i32 5, i32 116, i32 127, i32 13, i32 122, i32 120, i32 6, i32 5, i32 1, i32 0, i32 125, i32 1, i32 4, i32 124, i32 127, i32 3, i32 127, i32 5, i32 3, i32 122, i32 6, i32 10, i32 118, i32 124, i32 10, i32 124, i32 127, i32 6, i32 121, i32 3, i32 12, i32 117, i32 120, i32 10, i32 0, i32 121, i32 3, i32 126, i32 124, i32 6, i32 0, i32 121, i32 2, i32 126, i32 127, i32 6, i32 118, i32 127, i32 13, i32 121, i32 127, i32 6, i32 121, i32 6, i32 3, i32 113, i32 6, i32 10, i32 115, i32 127, i32 10, i32 0, i32 127, i32 122, i32 124, i32 10, i32 0, i32 117, i32 127, i32 12, i32 10, i32 124, i32 121, i32 9, i32 13, i32 125, i32 122, i32 5, i32 11, i32 10, i32 121, i32 124, i32 22, i32 3, i32 114, i32 13, i32 7, i32 121, i32 12, i32 7, i32 122, i32 11, i32 7, i32 122, i32 10, i32 7, i32 121, i32 10, i32 5, i32 117, i32 6, i32 5, i32 121, i32 5, i32 6, i32 1, i32 6, i32 0, i32 122, i32 2, i32 7, i32 3, i32 125, i32 1, i32 10, i32 7, i32 2, i32 127, i32 127, i32 9, i32 7, i32 121, i32 121, i32 6, i32 8, i32 125, i32 122, i32 6, i32 12, i32 6, i32 125, i32 127, i32 13, i32 7, i32 121, i32 1, i32 6, i32 127, i32 127, i32 2, i32 3, i32 1, i32 126, i32 1, i32 1, i32 125, i32 1, i32 0, i32 125, i32 6, i32 3, i32 125, i32 5, i32 7, i32 127, i32 124, i32 1, i32 6, i32 6, i32 124, i32 122, i32 7, i32 10, i32 0, i32 120, i32 1, i32 8, i32 0, i32 121, i32 122, i32 4, i32 10, i32 0, i32 120, i32 1, i32 6, i32 122, i32 117, i32 122, i32 0, i32 0, i32 121, i32 118, i32 127, i32 7, i32 0, i32 122, i32 125, i32 2, i32 4, i32 124, i32 122, i32 2, i32 5, i32 124, i32 122, i32 125, i32 127, i32 0, i32 120, i32 117, i32 127, i32 0, i32 121, i32 120, i32 121, i32 1, i32 3, i32 121, i32 121, i32 0, i32 0, i32 127, i32 127, i32 121, i32 127, i32 2, i32 122, i32 124, i32 125, i32 124, i32 127, i32 125, i32 121, i32 125, i32 0, i32 121, i32 122, i32 124, i32 125, i32 0, i32 125, i32 125, i32 0, i32 0, i32 0, i32 0, i32 125, i32 125, i32 0, i32 125, i32 126, i32 0, i32 126, i32 3, i32 3, i32 125, i32 1, i32 5, i32 0, i32 126, i32 125, i32 127, i32 3, i32 125, i32 121, i32 1, i32 2, i32 125, i32 127, i32 1, i32 0, i32 0, i32 127, i32 127, i32 126, i32 127, i32 0, i32 127, i32 0, i32 124, i32 125, i32 0, i32 121, i32 120, i32 124, i32 124, i32 123, i32 123, i32 125, i32 127, i32 0, i32 0, i32 127, i32 0, i32 1, i32 2, i32 0, i32 127, i32 0, i32 0, i32 0, i32 127, i32 126, i32 0, i32 0, i32 127, i32 0, i32 2, i32 1, i32 2, i32 6, i32 5, i32 3, i32 6, i32 8, i32 5, i32 2, i32 1, i32 1, i32 3, i32 0, i32 125, i32 127, i32 0, i32 127, i32 126, i32 0, i32 2, i32 3, i32 2, i32 1, i32 2, i32 3, i32 1, i32 124, i32 125, i32 0, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 127, i32 2, i32 3, i32 1, i32 0, i32 4, i32 6, i32 5, i32 6, i32 7, i32 10, i32 10, i32 4, i32 2, i32 5, i32 8, i32 9, i32 8, i32 7, i32 12, i32 20, i32 20, i32 16, i32 14, i32 20, i32 21, i32 15, i32 9, i32 7, i32 4, i32 126, i32 118, i32 100, i32 65, i32 72, i32 125, i32 108, i32 61, i32 103, i32 16, i32 6, i32 125, i32 117, i32 7, i32 29, i32 0, i32 108, i32 2, i32 125, i32 120, i32 119, i32 111, i32 119, i32 1, i32 0, i32 2, i32 7, i32 10, i32 28, i32 28, i32 23, i32 35, i32 47, i32 65, i32 67, i32 79, i32 85, i32 88, i32 126, i32 2, i32 76, i32 16, i32 105, i32 44, i32 13, i32 116, i32 42, i32 116, i32 99, i32 41, i32 124, i32 94, i32 33, i32 53, i32 70, i32 36, i32 103, i32 53, i32 60, i32 60, i32 38, i32 38, i32 47, i32 71, i32 100, i32 4, i32 19, i32 24, i32 39, i32 43, i32 48, i32 27, i32 127, i32 120, i32 114, i32 104, i32 92, i32 90, i32 104, i32 124, i32 3, i32 13, i32 38, i32 65, i32 81, i32 90, i32 106, i32 108, i32 84, i32 120, i32 9, i32 69, i32 121, i32 31, i32 11, i32 46, i32 96, i32 11, i32 102, i32 127, i32 104, i32 119, i32 78, i32 70, i32 74, i32 59, i32 18, i32 91, i32 55, i32 49, i32 33, i32 11, i32 18, i32 46, i32 87, i32 126, i32 25, i32 34, i32 43, i32 63, i32 58, i32 37, i32 11, i32 121, i32 113, i32 104, i32 97, i32 92, i32 102, i32 114, i32 6, i32 22, i32 41, i32 65, i32 94, i32 109, i32 102, i32 96, i32 110, i32 23, i32 72, i32 54, i32 18, i32 23, i32 47, i32 99, i32 120, i32 92, i32 119, i32 108, i32 117, i32 65, i32 73, i32 79, i32 59, i32 11, i32 84, i32 55, i32 0], align 4
@out_data = global [720 x i32] [i32 3, i32 -6, i32 -3, i32 29, i32 88, i32 137, i32 135, i32 86, i32 32, i32 7, i32 7, i32 4, i32 -7, i32 0, i32 40, i32 91, i32 107, i32 79, i32 43, i32 33, i32 45, i32 48, i32 39, i32 39, i32 55, i32 71, i32 66, i32 39, i32 8, i32 -12, i32 -11, i32 13, i32 46, i32 59, i32 37, i32 0, i32 -8, i32 29, i32 89, i32 131, i32 135, i32 111, i32 78, i32 47, i32 18, i32 -1, i32 -5, i32 4, i32 21, i32 35, i32 45, i32 49, i32 47, i32 41, i32 38, i32 42, i32 54, i32 72, i32 88, i32 95, i32 90, i32 79, i32 70, i32 65, i32 50, i32 27, i32 23, i32 55, i32 105, i32 123, i32 89, i32 47, i32 36, i32 48, i32 42, i32 8, i32 -10, i32 7, i32 36, i32 49, i32 47, i32 51, i32 50, i32 30, i32 4, i32 7, i32 35, i32 51, i32 33, i32 14, i32 30, i32 74, i32 97, i32 75, i32 33, i32 14, i32 34, i32 73, i32 94, i32 77, i32 37, i32 11, i32 24, i32 50, i32 51, i32 21, i32 5, i32 41, i32 100, i32 118, i32 77, i32 22, i32 9, i32 38, i32 55, i32 35, i32 11, i32 21, i32 60, i32 82, i32 64, i32 35, i32 29, i32 45, i32 54, i32 45, i32 36, i32 41, i32 50, i32 44, i32 33, i32 43, i32 80, i32 123, i32 141, i32 115, i32 71, i32 34, i32 15, i32 7, i32 -1, i32 0, i32 19, i32 45, i32 54, i32 43, i32 35, i32 50, i32 78, i32 92, i32 85, i32 79, i32 85, i32 92, i32 80, i32 52, i32 32, i32 34, i32 50, i32 56, i32 47, i32 37, i32 42, i32 53, i32 50, i32 35, i32 31, i32 54, i32 87, i32 96, i32 76, i32 49, i32 45, i32 64, i32 87, i32 103, i32 103, i32 76, i32 33, i32 4, i32 8, i32 32, i32 48, i32 44, i32 51, i32 78, i32 97, i32 86, i32 57, i32 38, i32 38, i32 43, i32 46, i32 56, i32 74, i32 87, i32 88, i32 92, i32 95, i32 80, i32 49, i32 29, i32 49, i32 88, i32 93, i32 55, i32 22, i32 35, i32 85, i32 113, i32 86, i32 40, i32 24, i32 48, i32 81, i32 96, i32 92, i32 82, i32 79, i32 84, i32 94, i32 98, i32 87, i32 69, i32 58, i32 53, i32 38, i32 23, i32 35, i32 71, i32 93, i32 72, i32 39, i32 48, i32 97, i32 121, i32 90, i32 49, i32 45, i32 69, i32 79, i32 65, i32 62, i32 72, i32 72, i32 58, i32 61, i32 83, i32 85, i32 47, i32 13, i32 31, i32 85, i32 105, i32 71, i32 30, i32 28, i32 50, i32 60, i32 49, i32 40, i32 45, i32 52, i32 50, i32 46, i32 46, i32 47, i32 45, i32 47, i32 50, i32 47, i32 38, i32 35, i32 48, i32 61, i32 44, i32 3, i32 -17, i32 10, i32 52, i32 57, i32 24, i32 10, i32 40, i32 66, i32 40, i32 -5, i32 -2, i32 55, i32 97, i32 83, i32 50, i32 53, i32 75, i32 76, i32 54, i32 54, i32 78, i32 86, i32 51, i32 14, i32 27, i32 78, i32 105, i32 81, i32 34, i32 13, i32 36, i32 75, i32 94, i32 77, i32 42, i32 18, i32 22, i32 41, i32 53, i32 51, i32 42, i32 37, i32 38, i32 47, i32 56, i32 49, i32 29, i32 29, i32 66, i32 104, i32 88, i32 26, i32 -1, i32 42, i32 99, i32 95, i32 39, i32 10, i32 34, i32 52, i32 30, i32 11, i32 39, i32 88, i32 90, i32 46, i32 16, i32 27, i32 40, i32 35, i32 49, i32 96, i32 124, i32 86, i32 27, i32 29, i32 93, i32 129, i32 92, i32 41, i32 44, i32 78, i32 81, i32 53, i32 51, i32 77, i32 83, i32 50, i32 36, i32 80, i32 134, i32 133, i32 90, i32 70, i32 93, i32 107, i32 91, i32 79, i32 99, i32 113, i32 84, i32 42, i32 44, i32 80, i32 86, i32 48, i32 30, i32 77, i32 141, i32 144, i32 91, i32 58, i32 85, i32 128, i32 137, i32 120, i32 123, i32 138, i32 125, i32 83, i32 62, i32 91, i32 131, i32 127, i32 89, i32 74, i32 91, i32 94, i32 46, i32 -12, i32 -13, i32 45, i32 95, i32 97, i32 80, i32 84, i32 94, i32 80, i32 48, i32 38, i32 52, i32 50, i32 24, i32 9, i32 39, i32 91, i32 116, i32 109, i32 94, i32 82, i32 64, i32 45, i32 52, i32 84, i32 92, i32 49, i32 0, i32 10, i32 86, i32 156, i32 150, i32 89, i32 46, i32 56, i32 87, i32 94, i32 75, i32 70, i32 94, i32 120, i32 124, i32 119, i32 128, i32 141, i32 125, i32 79, i32 43, i32 43, i32 51, i32 30, i32 0, i32 6, i32 40, i32 55, i32 29, i32 9, i32 36, i32 83, i32 93, i32 61, i32 31, i32 33, i32 41, i32 24, i32 -4, i32 -11, i32 6, i32 18, i32 9, i32 -3, i32 1, i32 15, i32 12, i32 -6, i32 -14, i32 9, i32 50, i32 77, i32 86, i32 92, i32 98, i32 83, i32 39, i32 0, i32 -4, i32 12, i32 8, i32 -16, i32 -7, i32 54, i32 106, i32 85, i32 28, i32 27, i32 96, i32 142, i32 97, i32 21, i32 20, i32 94, i32 140, i32 97, i32 29, i32 26, i32 82, i32 107, i32 61, i32 -5, i32 -24, i32 1, i32 21, i32 12, i32 -2, i32 0, i32 13, i32 17, i32 9, i32 1, i32 1, i32 7, i32 12, i32 11, i32 7, i32 6, i32 13, i32 22, i32 23, i32 16, i32 12, i32 19, i32 28, i32 19, i32 0, i32 0, i32 38, i32 95, i32 123, i32 104, i32 72, i32 72, i32 104, i32 125, i32 96, i32 45, i32 25, i32 55, i32 92, i32 90, i32 49, i32 15, i32 19, i32 49, i32 76, i32 94, i32 113, i32 131, i32 127, i32 88, i32 32, i32 -3, i32 -8, i32 9, i32 24, i32 25, i32 22, i32 25, i32 39, i32 55, i32 61, i32 66, i32 79, i32 98, i32 101, i32 79, i32 51, i32 44, i32 54, i32 61, i32 56, i32 52, i32 64, i32 84, i32 93, i32 91, i32 88, i32 89, i32 83, i32 65, i32 50, i32 51, i32 63, i32 74, i32 75, i32 67, i32 51, i32 37, i32 40, i32 61, i32 79, i32 68, i32 35, i32 14, i32 22, i32 41, i32 44, i32 40, i32 57, i32 99, i32 132, i32 125, i32 95, i32 86, i32 105, i32 115, i32 86, i32 36, i32 12, i32 30, i32 64, i32 86, i32 96, i32 105, i32 110, i32 99, i32 78, i32 66, i32 68, i32 71, i32 59, i32 42, i32 34, i32 45, i32 69, i32 93, i32 112, i32 119, i32 109, i32 91, i32 74, i32 63, i32 55, i32 50, i32 57, i32 67, i32 61, i32 32, i32 5, i32 16, i32 63, i32 100, i32 90, i32 52, i32 33, i32 46, i32 62, i32 51, i32 34, i32 48, i32 89, i32 117, i32 113, i32 96, i32 97, i32 103, i32 85, i32 45, i32 18, i32 29, i32 67, i32 101, i32 113, i32 108, i32 95, i32 83, i32 71, i32 57, i32 41, i32 28, i32 30, i32 53, i32 86, i32 111, i32 116, i32 111, i32 106, i32 102, i32 92, i32 75, i32 58, i32 51, i32 54, i32 56, i32 44, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@output = global [720 x i32] [i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1], align 4

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.body.i

for.body.i:                                       ; preds = %if.end.i, %entry
  %out.addr.052.i = phi i32* [ getelementptr inbounds ([720 x i32], [720 x i32]* @output, i32 0, i32 0), %entry ], [ %out.addr.1.i, %if.end.i ]
  %coef_start.051.i = phi i32* [ getelementptr inbounds ([36 x i32], [36 x i32]* @fir_int, i32 0, i32 0), %entry ], [ %coef_start.1.i, %if.end.i ]
  %in_ptr.050.i = phi i32* [ getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 17), %entry ], [ %in_ptr.1.i, %if.end.i ]
  %acc_length.049.i = phi i32 [ 18, %entry ], [ %acc_length.2.i, %if.end.i ]
  %i.048.i = phi i32 [ 0, %entry ], [ %inc24.i, %if.end.i ]
  %incdec.ptr.i = getelementptr inbounds i32, i32* %coef_start.051.i, i32 1
  %0 = load i32, i32* %coef_start.051.i, align 4, !tbaa !1
  %1 = load i32, i32* %in_ptr.050.i, align 4, !tbaa !1
  %mul.i = mul nsw i32 %1, %0
  %cmp642.i = icmp sgt i32 %acc_length.049.i, 1
  br i1 %cmp642.i, label %for.body7.i.preheader, label %for.end.i

for.body7.i.preheader:                            ; preds = %for.body.i
  %backedge.overflow = icmp eq i32 %acc_length.049.i, 1
  br i1 %backedge.overflow, label %for.body7.i.preheader36, label %overflow.checked

overflow.checked:                                 ; preds = %for.body7.i.preheader
  %2 = add i32 %acc_length.049.i, -1
  %n.vec = and i32 %2, -4
  %end.idx.rnd.down32 = or i32 %n.vec, 1
  %cmp.zero = icmp eq i32 %end.idx.rnd.down32, 1
  %3 = sub i32 0, %n.vec
  %ptr.ind.end = getelementptr i32, i32* %in_ptr.050.i, i32 %3
  %incdec.ptr.i.sum33 = or i32 %n.vec, 1
  %ptr.ind.end9 = getelementptr i32, i32* %coef_start.051.i, i32 %incdec.ptr.i.sum33
  %4 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %mul.i, i32 0
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 1, %vector.body.preheader ]
  %vec.phi = phi <4 x i32> [ %10, %vector.body ], [ %4, %vector.body.preheader ]
  %5 = sub i32 1, %index
  %next.gep19 = getelementptr i32, i32* %coef_start.051.i, i32 %index
  %6 = bitcast i32* %next.gep19 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %6, align 4, !tbaa !1
  %.sum = add i32 %5, -4
  %7 = getelementptr i32, i32* %in_ptr.050.i, i32 %.sum
  %8 = bitcast i32* %7 to <4 x i32>*
  %wide.load27 = load <4 x i32>, <4 x i32>* %8, align 4, !tbaa !1
  %reverse = shufflevector <4 x i32> %wide.load27, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %9 = mul nsw <4 x i32> %reverse, %wide.load
  %10 = add nsw <4 x i32> %9, %vec.phi
  %index.next = add i32 %index, 4
  %11 = icmp eq i32 %index.next, %end.idx.rnd.down32
  br i1 %11, label %middle.block.loopexit, label %vector.body, !llvm.loop !5

middle.block.loopexit:                            ; preds = %vector.body
  %.lcssa = phi <4 x i32> [ %10, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32* [ %in_ptr.050.i, %overflow.checked ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val7 = phi i32* [ %incdec.ptr.i, %overflow.checked ], [ %ptr.ind.end9, %middle.block.loopexit ]
  %resume.val10 = phi i32 [ 1, %overflow.checked ], [ %end.idx.rnd.down32, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <4 x i32> [ %4, %overflow.checked ], [ %.lcssa, %middle.block.loopexit ]
  %rdx.shuf = shufflevector <4 x i32> %rdx.vec.exit.phi, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi, %rdx.shuf
  %rdx.shuf30 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx31 = add <4 x i32> %bin.rdx, %rdx.shuf30
  %12 = extractelement <4 x i32> %bin.rdx31, i32 0
  %cmp.n = icmp eq i32 %acc_length.049.i, %resume.val10
  br i1 %cmp.n, label %for.end.i, label %for.body7.i.preheader36

for.body7.i.preheader36:                          ; preds = %middle.block, %for.body7.i.preheader
  %in_ptr.050.pn.i.ph = phi i32* [ %in_ptr.050.i, %for.body7.i.preheader ], [ %resume.val, %middle.block ]
  %coef_ptr.045.i.ph = phi i32* [ %incdec.ptr.i, %for.body7.i.preheader ], [ %resume.val7, %middle.block ]
  %acc.044.i.ph = phi i32 [ %mul.i, %for.body7.i.preheader ], [ %12, %middle.block ]
  %j.043.i.ph = phi i32 [ 1, %for.body7.i.preheader ], [ %resume.val10, %middle.block ]
  br label %for.body7.i

for.body7.i:                                      ; preds = %for.body7.i.preheader36, %for.body7.i
  %in_ptr.050.pn.i = phi i32* [ %data_ptr.046.i, %for.body7.i ], [ %in_ptr.050.pn.i.ph, %for.body7.i.preheader36 ]
  %coef_ptr.045.i = phi i32* [ %incdec.ptr8.i, %for.body7.i ], [ %coef_ptr.045.i.ph, %for.body7.i.preheader36 ]
  %acc.044.i = phi i32 [ %add11.i, %for.body7.i ], [ %acc.044.i.ph, %for.body7.i.preheader36 ]
  %j.043.i = phi i32 [ %inc.i, %for.body7.i ], [ %j.043.i.ph, %for.body7.i.preheader36 ]
  %data_ptr.046.i = getelementptr inbounds i32, i32* %in_ptr.050.pn.i, i32 -1
  %incdec.ptr8.i = getelementptr inbounds i32, i32* %coef_ptr.045.i, i32 1
  %13 = load i32, i32* %coef_ptr.045.i, align 4, !tbaa !1
  %14 = load i32, i32* %data_ptr.046.i, align 4, !tbaa !1
  %mul10.i = mul nsw i32 %14, %13
  %add11.i = add nsw i32 %mul10.i, %acc.044.i
  %inc.i = add nuw nsw i32 %j.043.i, 1
  %exitcond.i = icmp eq i32 %inc.i, %acc_length.049.i
  br i1 %exitcond.i, label %for.end.i.loopexit, label %for.body7.i, !llvm.loop !8

for.end.i.loopexit:                               ; preds = %for.body7.i
  %add11.i.lcssa = phi i32 [ %add11.i, %for.body7.i ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %middle.block, %for.body.i
  %acc.0.lcssa.i = phi i32 [ %mul.i, %for.body.i ], [ %12, %middle.block ], [ %add11.i.lcssa, %for.end.i.loopexit ]
  %cmp12.i = icmp eq i32 %acc.0.lcssa.i, 14535
  br i1 %cmp12.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %for.end.i
  %incdec.ptr13.i = getelementptr inbounds i32, i32* %out.addr.052.i, i32 1
  store i32 51, i32* %out.addr.052.i, align 4, !tbaa !1
  br label %if.end.i

if.end.i:                                         ; preds = %if.then.i, %for.end.i
  %out.addr.1.i = phi i32* [ %incdec.ptr13.i, %if.then.i ], [ %out.addr.052.i, %for.end.i ]
  %cmp14.i = icmp eq i32* %in_ptr.050.i, getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 699)
  %cmp17.i = icmp slt i32 %acc_length.049.i, 35
  %inc19.i = zext i1 %cmp17.i to i32
  %incdec.ptr21.i = getelementptr inbounds i32, i32* %in_ptr.050.i, i32 1
  %acc_length.2.v.i = select i1 %cmp14.i, i32 -1, i32 %inc19.i
  %acc_length.2.i = add i32 %acc_length.2.v.i, %acc_length.049.i
  %in_ptr.1.i = select i1 %cmp14.i, i32* getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 699), i32* %incdec.ptr21.i
  %coef_start.1.i = select i1 %cmp14.i, i32* %incdec.ptr.i, i32* %coef_start.051.i
  %inc24.i = add nuw nsw i32 %i.048.i, 1
  %exitcond53.i = icmp eq i32 %inc24.i, 700
  br i1 %exitcond53.i, label %for.body.preheader, label %for.body.i

for.body.preheader:                               ; preds = %if.end.i
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %i.06 = phi i32 [ %inc, %for.inc ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds [720 x i32], [720 x i32]* @output, i32 0, i32 %i.06
  %15 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %arrayidx1 = getelementptr inbounds [720 x i32], [720 x i32]* @out_data, i32 0, i32 %i.06
  %16 = load i32, i32* %arrayidx1, align 4, !tbaa !1
  %cmp2 = icmp eq i32 %15, %16
  br i1 %cmp2, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.06, 1
  %cmp = icmp slt i32 %inc, 700
  br i1 %cmp, label %for.body, label %return

return:                                           ; preds = %for.inc, %for.body
  %retval.0 = phi i32 [ %i.06, %for.body ], [ -1, %for.inc ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define void @fir_filter_int(i32* readonly %in, i32* nocapture %out, i32 %in_len, i32* nocapture readonly %coef, i32 %coef_len, i32 %scale) #0 {
entry:
  %add = add nsw i32 %coef_len, 1
  %shr = ashr i32 %add, 1
  %add.ptr.sum = add i32 %in_len, -1
  %add.ptr1 = getelementptr inbounds i32, i32* %in, i32 %add.ptr.sum
  %cmp47 = icmp sgt i32 %in_len, 0
  br i1 %cmp47, label %for.body.lr.ph, label %for.end25

for.body.lr.ph:                                   ; preds = %entry
  %add.ptr2.sum = add nsw i32 %shr, -1
  %add.ptr3 = getelementptr inbounds i32, i32* %in, i32 %add.ptr2.sum
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.lr.ph
  %out.addr.052 = phi i32* [ %out, %for.body.lr.ph ], [ %out.addr.1, %if.end ]
  %coef_start.051 = phi i32* [ %coef, %for.body.lr.ph ], [ %coef_start.1, %if.end ]
  %in_ptr.050 = phi i32* [ %add.ptr3, %for.body.lr.ph ], [ %in_ptr.1, %if.end ]
  %acc_length.049 = phi i32 [ %shr, %for.body.lr.ph ], [ %acc_length.2, %if.end ]
  %i.048 = phi i32 [ 0, %for.body.lr.ph ], [ %inc24, %if.end ]
  %incdec.ptr = getelementptr inbounds i32, i32* %coef_start.051, i32 1
  %0 = load i32, i32* %coef_start.051, align 4, !tbaa !1
  %1 = load i32, i32* %in_ptr.050, align 4, !tbaa !1
  %mul = mul nsw i32 %1, %0
  %cmp642 = icmp sgt i32 %acc_length.049, 1
  br i1 %cmp642, label %for.body7.preheader, label %for.end

for.body7.preheader:                              ; preds = %for.body
  %backedge.overflow = icmp eq i32 %acc_length.049, 1
  br i1 %backedge.overflow, label %for.body7.preheader83, label %overflow.checked

overflow.checked:                                 ; preds = %for.body7.preheader
  %2 = add i32 %acc_length.049, -1
  %n.vec = and i32 %2, -4
  %end.idx.rnd.down79 = or i32 %n.vec, 1
  %cmp.zero = icmp eq i32 %end.idx.rnd.down79, 1
  %3 = sub i32 0, %n.vec
  %ptr.ind.end = getelementptr i32, i32* %in_ptr.050, i32 %3
  %incdec.ptr.sum80 = or i32 %n.vec, 1
  %ptr.ind.end56 = getelementptr i32, i32* %coef_start.051, i32 %incdec.ptr.sum80
  %4 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %mul, i32 0
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 1, %vector.body.preheader ]
  %vec.phi = phi <4 x i32> [ %10, %vector.body ], [ %4, %vector.body.preheader ]
  %5 = sub i32 1, %index
  %next.gep66 = getelementptr i32, i32* %coef_start.051, i32 %index
  %6 = bitcast i32* %next.gep66 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %6, align 4, !tbaa !1
  %.sum = add i32 %5, -4
  %7 = getelementptr i32, i32* %in_ptr.050, i32 %.sum
  %8 = bitcast i32* %7 to <4 x i32>*
  %wide.load74 = load <4 x i32>, <4 x i32>* %8, align 4, !tbaa !1
  %reverse = shufflevector <4 x i32> %wide.load74, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %9 = mul nsw <4 x i32> %reverse, %wide.load
  %10 = add nsw <4 x i32> %9, %vec.phi
  %index.next = add i32 %index, 4
  %11 = icmp eq i32 %index.next, %end.idx.rnd.down79
  br i1 %11, label %middle.block.loopexit, label %vector.body, !llvm.loop !10

middle.block.loopexit:                            ; preds = %vector.body
  %.lcssa = phi <4 x i32> [ %10, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32* [ %in_ptr.050, %overflow.checked ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val54 = phi i32* [ %incdec.ptr, %overflow.checked ], [ %ptr.ind.end56, %middle.block.loopexit ]
  %resume.val57 = phi i32 [ 1, %overflow.checked ], [ %end.idx.rnd.down79, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <4 x i32> [ %4, %overflow.checked ], [ %.lcssa, %middle.block.loopexit ]
  %rdx.shuf = shufflevector <4 x i32> %rdx.vec.exit.phi, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi, %rdx.shuf
  %rdx.shuf77 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx78 = add <4 x i32> %bin.rdx, %rdx.shuf77
  %12 = extractelement <4 x i32> %bin.rdx78, i32 0
  %cmp.n = icmp eq i32 %acc_length.049, %resume.val57
  br i1 %cmp.n, label %for.end, label %for.body7.preheader83

for.body7.preheader83:                            ; preds = %middle.block, %for.body7.preheader
  %in_ptr.050.pn.ph = phi i32* [ %in_ptr.050, %for.body7.preheader ], [ %resume.val, %middle.block ]
  %coef_ptr.045.ph = phi i32* [ %incdec.ptr, %for.body7.preheader ], [ %resume.val54, %middle.block ]
  %acc.044.ph = phi i32 [ %mul, %for.body7.preheader ], [ %12, %middle.block ]
  %j.043.ph = phi i32 [ 1, %for.body7.preheader ], [ %resume.val57, %middle.block ]
  br label %for.body7

for.body7:                                        ; preds = %for.body7.preheader83, %for.body7
  %in_ptr.050.pn = phi i32* [ %data_ptr.046, %for.body7 ], [ %in_ptr.050.pn.ph, %for.body7.preheader83 ]
  %coef_ptr.045 = phi i32* [ %incdec.ptr8, %for.body7 ], [ %coef_ptr.045.ph, %for.body7.preheader83 ]
  %acc.044 = phi i32 [ %add11, %for.body7 ], [ %acc.044.ph, %for.body7.preheader83 ]
  %j.043 = phi i32 [ %inc, %for.body7 ], [ %j.043.ph, %for.body7.preheader83 ]
  %data_ptr.046 = getelementptr inbounds i32, i32* %in_ptr.050.pn, i32 -1
  %incdec.ptr8 = getelementptr inbounds i32, i32* %coef_ptr.045, i32 1
  %13 = load i32, i32* %coef_ptr.045, align 4, !tbaa !1
  %14 = load i32, i32* %data_ptr.046, align 4, !tbaa !1
  %mul10 = mul nsw i32 %14, %13
  %add11 = add nsw i32 %mul10, %acc.044
  %inc = add nuw nsw i32 %j.043, 1
  %exitcond = icmp eq i32 %inc, %acc_length.049
  br i1 %exitcond, label %for.end.loopexit, label %for.body7, !llvm.loop !11

for.end.loopexit:                                 ; preds = %for.body7
  %add11.lcssa = phi i32 [ %add11, %for.body7 ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %for.body
  %acc.0.lcssa = phi i32 [ %mul, %for.body ], [ %12, %middle.block ], [ %add11.lcssa, %for.end.loopexit ]
  %cmp12 = icmp eq i32 %acc.0.lcssa, 14535
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %div = sdiv i32 14535, %scale
  %incdec.ptr13 = getelementptr inbounds i32, i32* %out.addr.052, i32 1
  store i32 %div, i32* %out.addr.052, align 4, !tbaa !1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %out.addr.1 = phi i32* [ %incdec.ptr13, %if.then ], [ %out.addr.052, %for.end ]
  %cmp14 = icmp eq i32* %in_ptr.050, %add.ptr1
  %cmp17 = icmp slt i32 %acc_length.049, %coef_len
  %inc19 = zext i1 %cmp17 to i32
  %incdec.ptr21 = getelementptr inbounds i32, i32* %in_ptr.050, i32 1
  %acc_length.2.v = select i1 %cmp14, i32 -1, i32 %inc19
  %acc_length.2 = add i32 %acc_length.049, %acc_length.2.v
  %in_ptr.1 = select i1 %cmp14, i32* %in_ptr.050, i32* %incdec.ptr21
  %coef_start.1 = select i1 %cmp14, i32* %incdec.ptr, i32* %coef_start.051
  %inc24 = add nuw nsw i32 %i.048, 1
  %exitcond53 = icmp eq i32 %inc24, %in_len
  br i1 %exitcond53, label %for.end25.loopexit, label %for.body

for.end25.loopexit:                               ; preds = %if.end
  br label %for.end25

for.end25:                                        ; preds = %for.end25.loopexit, %entry
  ret void
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.vectorize.width", i32 1}
!7 = !{!"llvm.loop.interleave.count", i32 1}
!8 = distinct !{!8, !9, !6, !7}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !6, !7}
!11 = distinct !{!11, !9, !6, !7}
