; ModuleID = 'fir_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@fir_int = global [36 x i32] [i32 -2, i32 1, i32 4, i32 3, i32 -2, i32 -4, i32 2, i32 7, i32 0, i32 -9, i32 -4, i32 12, i32 11, i32 -14, i32 -26, i32 15, i32 89, i32 127, i32 89, i32 15, i32 -26, i32 -14, i32 11, i32 12, i32 -4, i32 -9, i32 0, i32 7, i32 2, i32 -4, i32 -2, i32 3, i32 4, i32 1, i32 -2, i32 0], align 4
@in_data = global [701 x i32] [i32 0, i32 0, i32 0, i32 0, i32 127, i32 121, i32 114, i32 121, i32 13, i32 13, i32 0, i32 3, i32 5, i32 2, i32 3, i32 127, i32 127, i32 2, i32 126, i32 0, i32 1, i32 126, i32 1, i32 1, i32 127, i32 0, i32 127, i32 0, i32 2, i32 1, i32 1, i32 3, i32 1, i32 127, i32 1, i32 0, i32 1, i32 1, i32 125, i32 123, i32 115, i32 106, i32 119, i32 16, i32 14, i32 1, i32 5, i32 5, i32 5, i32 5, i32 125, i32 0, i32 2, i32 125, i32 0, i32 0, i32 126, i32 1, i32 126, i32 127, i32 3, i32 124, i32 126, i32 6, i32 0, i32 126, i32 3, i32 2, i32 127, i32 126, i32 127, i32 2, i32 1, i32 127, i32 1, i32 1, i32 0, i32 3, i32 0, i32 127, i32 2, i32 0, i32 127, i32 3, i32 1, i32 0, i32 0, i32 125, i32 0, i32 3, i32 0, i32 126, i32 127, i32 2, i32 1, i32 126, i32 0, i32 3, i32 127, i32 125, i32 1, i32 1, i32 1, i32 127, i32 0, i32 5, i32 0, i32 127, i32 2, i32 126, i32 127, i32 2, i32 1, i32 0, i32 126, i32 0, i32 5, i32 0, i32 127, i32 0, i32 126, i32 1, i32 0, i32 125, i32 1, i32 3, i32 127, i32 0, i32 0, i32 126, i32 2, i32 3, i32 126, i32 125, i32 114, i32 104, i32 113, i32 5, i32 12, i32 7, i32 2, i32 6, i32 13, i32 5, i32 125, i32 3, i32 2, i32 127, i32 0, i32 121, i32 122, i32 3, i32 126, i32 125, i32 0, i32 125, i32 2, i32 1, i32 125, i32 8, i32 3, i32 124, i32 6, i32 0, i32 122, i32 6, i32 2, i32 124, i32 3, i32 126, i32 121, i32 6, i32 5, i32 116, i32 127, i32 13, i32 122, i32 120, i32 6, i32 5, i32 1, i32 0, i32 125, i32 1, i32 4, i32 124, i32 127, i32 3, i32 127, i32 5, i32 3, i32 122, i32 6, i32 10, i32 118, i32 124, i32 10, i32 124, i32 127, i32 6, i32 121, i32 3, i32 12, i32 117, i32 120, i32 10, i32 0, i32 121, i32 3, i32 126, i32 124, i32 6, i32 0, i32 121, i32 2, i32 126, i32 127, i32 6, i32 118, i32 127, i32 13, i32 121, i32 127, i32 6, i32 121, i32 6, i32 3, i32 113, i32 6, i32 10, i32 115, i32 127, i32 10, i32 0, i32 127, i32 122, i32 124, i32 10, i32 0, i32 117, i32 127, i32 12, i32 10, i32 124, i32 121, i32 9, i32 13, i32 125, i32 122, i32 5, i32 11, i32 10, i32 121, i32 124, i32 22, i32 3, i32 114, i32 13, i32 7, i32 121, i32 12, i32 7, i32 122, i32 11, i32 7, i32 122, i32 10, i32 7, i32 121, i32 10, i32 5, i32 117, i32 6, i32 5, i32 121, i32 5, i32 6, i32 1, i32 6, i32 0, i32 122, i32 2, i32 7, i32 3, i32 125, i32 1, i32 10, i32 7, i32 2, i32 127, i32 127, i32 9, i32 7, i32 121, i32 121, i32 6, i32 8, i32 125, i32 122, i32 6, i32 12, i32 6, i32 125, i32 127, i32 13, i32 7, i32 121, i32 1, i32 6, i32 127, i32 127, i32 2, i32 3, i32 1, i32 126, i32 1, i32 1, i32 125, i32 1, i32 0, i32 125, i32 6, i32 3, i32 125, i32 5, i32 7, i32 127, i32 124, i32 1, i32 6, i32 6, i32 124, i32 122, i32 7, i32 10, i32 0, i32 120, i32 1, i32 8, i32 0, i32 121, i32 122, i32 4, i32 10, i32 0, i32 120, i32 1, i32 6, i32 122, i32 117, i32 122, i32 0, i32 0, i32 121, i32 118, i32 127, i32 7, i32 0, i32 122, i32 125, i32 2, i32 4, i32 124, i32 122, i32 2, i32 5, i32 124, i32 122, i32 125, i32 127, i32 0, i32 120, i32 117, i32 127, i32 0, i32 121, i32 120, i32 121, i32 1, i32 3, i32 121, i32 121, i32 0, i32 0, i32 127, i32 127, i32 121, i32 127, i32 2, i32 122, i32 124, i32 125, i32 124, i32 127, i32 125, i32 121, i32 125, i32 0, i32 121, i32 122, i32 124, i32 125, i32 0, i32 125, i32 125, i32 0, i32 0, i32 0, i32 0, i32 125, i32 125, i32 0, i32 125, i32 126, i32 0, i32 126, i32 3, i32 3, i32 125, i32 1, i32 5, i32 0, i32 126, i32 125, i32 127, i32 3, i32 125, i32 121, i32 1, i32 2, i32 125, i32 127, i32 1, i32 0, i32 0, i32 127, i32 127, i32 126, i32 127, i32 0, i32 127, i32 0, i32 124, i32 125, i32 0, i32 121, i32 120, i32 124, i32 124, i32 123, i32 123, i32 125, i32 127, i32 0, i32 0, i32 127, i32 0, i32 1, i32 2, i32 0, i32 127, i32 0, i32 0, i32 0, i32 127, i32 126, i32 0, i32 0, i32 127, i32 0, i32 2, i32 1, i32 2, i32 6, i32 5, i32 3, i32 6, i32 8, i32 5, i32 2, i32 1, i32 1, i32 3, i32 0, i32 125, i32 127, i32 0, i32 127, i32 126, i32 0, i32 2, i32 3, i32 2, i32 1, i32 2, i32 3, i32 1, i32 124, i32 125, i32 0, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 127, i32 2, i32 3, i32 1, i32 0, i32 4, i32 6, i32 5, i32 6, i32 7, i32 10, i32 10, i32 4, i32 2, i32 5, i32 8, i32 9, i32 8, i32 7, i32 12, i32 20, i32 20, i32 16, i32 14, i32 20, i32 21, i32 15, i32 9, i32 7, i32 4, i32 126, i32 118, i32 100, i32 65, i32 72, i32 125, i32 108, i32 61, i32 103, i32 16, i32 6, i32 125, i32 117, i32 7, i32 29, i32 0, i32 108, i32 2, i32 125, i32 120, i32 119, i32 111, i32 119, i32 1, i32 0, i32 2, i32 7, i32 10, i32 28, i32 28, i32 23, i32 35, i32 47, i32 65, i32 67, i32 79, i32 85, i32 88, i32 126, i32 2, i32 76, i32 16, i32 105, i32 44, i32 13, i32 116, i32 42, i32 116, i32 99, i32 41, i32 124, i32 94, i32 33, i32 53, i32 70, i32 36, i32 103, i32 53, i32 60, i32 60, i32 38, i32 38, i32 47, i32 71, i32 100, i32 4, i32 19, i32 24, i32 39, i32 43, i32 48, i32 27, i32 127, i32 120, i32 114, i32 104, i32 92, i32 90, i32 104, i32 124, i32 3, i32 13, i32 38, i32 65, i32 81, i32 90, i32 106, i32 108, i32 84, i32 120, i32 9, i32 69, i32 121, i32 31, i32 11, i32 46, i32 96, i32 11, i32 102, i32 127, i32 104, i32 119, i32 78, i32 70, i32 74, i32 59, i32 18, i32 91, i32 55, i32 49, i32 33, i32 11, i32 18, i32 46, i32 87, i32 126, i32 25, i32 34, i32 43, i32 63, i32 58, i32 37, i32 11, i32 121, i32 113, i32 104, i32 97, i32 92, i32 102, i32 114, i32 6, i32 22, i32 41, i32 65, i32 94, i32 109, i32 102, i32 96, i32 110, i32 23, i32 72, i32 54, i32 18, i32 23, i32 47, i32 99, i32 120, i32 92, i32 119, i32 108, i32 117, i32 65, i32 73, i32 79, i32 59, i32 11, i32 84, i32 55, i32 0], align 4
@out_data = global [720 x i32] [i32 3, i32 -6, i32 -3, i32 29, i32 88, i32 137, i32 135, i32 86, i32 32, i32 7, i32 7, i32 4, i32 -7, i32 0, i32 40, i32 91, i32 107, i32 79, i32 43, i32 33, i32 45, i32 48, i32 39, i32 39, i32 55, i32 71, i32 66, i32 39, i32 8, i32 -12, i32 -11, i32 13, i32 46, i32 59, i32 37, i32 0, i32 -8, i32 29, i32 89, i32 131, i32 135, i32 111, i32 78, i32 47, i32 18, i32 -1, i32 -5, i32 4, i32 21, i32 35, i32 45, i32 49, i32 47, i32 41, i32 38, i32 42, i32 54, i32 72, i32 88, i32 95, i32 90, i32 79, i32 70, i32 65, i32 50, i32 27, i32 23, i32 55, i32 105, i32 123, i32 89, i32 47, i32 36, i32 48, i32 42, i32 8, i32 -10, i32 7, i32 36, i32 49, i32 47, i32 51, i32 50, i32 30, i32 4, i32 7, i32 35, i32 51, i32 33, i32 14, i32 30, i32 74, i32 97, i32 75, i32 33, i32 14, i32 34, i32 73, i32 94, i32 77, i32 37, i32 11, i32 24, i32 50, i32 51, i32 21, i32 5, i32 41, i32 100, i32 118, i32 77, i32 22, i32 9, i32 38, i32 55, i32 35, i32 11, i32 21, i32 60, i32 82, i32 64, i32 35, i32 29, i32 45, i32 54, i32 45, i32 36, i32 41, i32 50, i32 44, i32 33, i32 43, i32 80, i32 123, i32 141, i32 115, i32 71, i32 34, i32 15, i32 7, i32 -1, i32 0, i32 19, i32 45, i32 54, i32 43, i32 35, i32 50, i32 78, i32 92, i32 85, i32 79, i32 85, i32 92, i32 80, i32 52, i32 32, i32 34, i32 50, i32 56, i32 47, i32 37, i32 42, i32 53, i32 50, i32 35, i32 31, i32 54, i32 87, i32 96, i32 76, i32 49, i32 45, i32 64, i32 87, i32 103, i32 103, i32 76, i32 33, i32 4, i32 8, i32 32, i32 48, i32 44, i32 51, i32 78, i32 97, i32 86, i32 57, i32 38, i32 38, i32 43, i32 46, i32 56, i32 74, i32 87, i32 88, i32 92, i32 95, i32 80, i32 49, i32 29, i32 49, i32 88, i32 93, i32 55, i32 22, i32 35, i32 85, i32 113, i32 86, i32 40, i32 24, i32 48, i32 81, i32 96, i32 92, i32 82, i32 79, i32 84, i32 94, i32 98, i32 87, i32 69, i32 58, i32 53, i32 38, i32 23, i32 35, i32 71, i32 93, i32 72, i32 39, i32 48, i32 97, i32 121, i32 90, i32 49, i32 45, i32 69, i32 79, i32 65, i32 62, i32 72, i32 72, i32 58, i32 61, i32 83, i32 85, i32 47, i32 13, i32 31, i32 85, i32 105, i32 71, i32 30, i32 28, i32 50, i32 60, i32 49, i32 40, i32 45, i32 52, i32 50, i32 46, i32 46, i32 47, i32 45, i32 47, i32 50, i32 47, i32 38, i32 35, i32 48, i32 61, i32 44, i32 3, i32 -17, i32 10, i32 52, i32 57, i32 24, i32 10, i32 40, i32 66, i32 40, i32 -5, i32 -2, i32 55, i32 97, i32 83, i32 50, i32 53, i32 75, i32 76, i32 54, i32 54, i32 78, i32 86, i32 51, i32 14, i32 27, i32 78, i32 105, i32 81, i32 34, i32 13, i32 36, i32 75, i32 94, i32 77, i32 42, i32 18, i32 22, i32 41, i32 53, i32 51, i32 42, i32 37, i32 38, i32 47, i32 56, i32 49, i32 29, i32 29, i32 66, i32 104, i32 88, i32 26, i32 -1, i32 42, i32 99, i32 95, i32 39, i32 10, i32 34, i32 52, i32 30, i32 11, i32 39, i32 88, i32 90, i32 46, i32 16, i32 27, i32 40, i32 35, i32 49, i32 96, i32 124, i32 86, i32 27, i32 29, i32 93, i32 129, i32 92, i32 41, i32 44, i32 78, i32 81, i32 53, i32 51, i32 77, i32 83, i32 50, i32 36, i32 80, i32 134, i32 133, i32 90, i32 70, i32 93, i32 107, i32 91, i32 79, i32 99, i32 113, i32 84, i32 42, i32 44, i32 80, i32 86, i32 48, i32 30, i32 77, i32 141, i32 144, i32 91, i32 58, i32 85, i32 128, i32 137, i32 120, i32 123, i32 138, i32 125, i32 83, i32 62, i32 91, i32 131, i32 127, i32 89, i32 74, i32 91, i32 94, i32 46, i32 -12, i32 -13, i32 45, i32 95, i32 97, i32 80, i32 84, i32 94, i32 80, i32 48, i32 38, i32 52, i32 50, i32 24, i32 9, i32 39, i32 91, i32 116, i32 109, i32 94, i32 82, i32 64, i32 45, i32 52, i32 84, i32 92, i32 49, i32 0, i32 10, i32 86, i32 156, i32 150, i32 89, i32 46, i32 56, i32 87, i32 94, i32 75, i32 70, i32 94, i32 120, i32 124, i32 119, i32 128, i32 141, i32 125, i32 79, i32 43, i32 43, i32 51, i32 30, i32 0, i32 6, i32 40, i32 55, i32 29, i32 9, i32 36, i32 83, i32 93, i32 61, i32 31, i32 33, i32 41, i32 24, i32 -4, i32 -11, i32 6, i32 18, i32 9, i32 -3, i32 1, i32 15, i32 12, i32 -6, i32 -14, i32 9, i32 50, i32 77, i32 86, i32 92, i32 98, i32 83, i32 39, i32 0, i32 -4, i32 12, i32 8, i32 -16, i32 -7, i32 54, i32 106, i32 85, i32 28, i32 27, i32 96, i32 142, i32 97, i32 21, i32 20, i32 94, i32 140, i32 97, i32 29, i32 26, i32 82, i32 107, i32 61, i32 -5, i32 -24, i32 1, i32 21, i32 12, i32 -2, i32 0, i32 13, i32 17, i32 9, i32 1, i32 1, i32 7, i32 12, i32 11, i32 7, i32 6, i32 13, i32 22, i32 23, i32 16, i32 12, i32 19, i32 28, i32 19, i32 0, i32 0, i32 38, i32 95, i32 123, i32 104, i32 72, i32 72, i32 104, i32 125, i32 96, i32 45, i32 25, i32 55, i32 92, i32 90, i32 49, i32 15, i32 19, i32 49, i32 76, i32 94, i32 113, i32 131, i32 127, i32 88, i32 32, i32 -3, i32 -8, i32 9, i32 24, i32 25, i32 22, i32 25, i32 39, i32 55, i32 61, i32 66, i32 79, i32 98, i32 101, i32 79, i32 51, i32 44, i32 54, i32 61, i32 56, i32 52, i32 64, i32 84, i32 93, i32 91, i32 88, i32 89, i32 83, i32 65, i32 50, i32 51, i32 63, i32 74, i32 75, i32 67, i32 51, i32 37, i32 40, i32 61, i32 79, i32 68, i32 35, i32 14, i32 22, i32 41, i32 44, i32 40, i32 57, i32 99, i32 132, i32 125, i32 95, i32 86, i32 105, i32 115, i32 86, i32 36, i32 12, i32 30, i32 64, i32 86, i32 96, i32 105, i32 110, i32 99, i32 78, i32 66, i32 68, i32 71, i32 59, i32 42, i32 34, i32 45, i32 69, i32 93, i32 112, i32 119, i32 109, i32 91, i32 74, i32 63, i32 55, i32 50, i32 57, i32 67, i32 61, i32 32, i32 5, i32 16, i32 63, i32 100, i32 90, i32 52, i32 33, i32 46, i32 62, i32 51, i32 34, i32 48, i32 89, i32 117, i32 113, i32 96, i32 97, i32 103, i32 85, i32 45, i32 18, i32 29, i32 67, i32 101, i32 113, i32 108, i32 95, i32 83, i32 71, i32 57, i32 41, i32 28, i32 30, i32 53, i32 86, i32 111, i32 116, i32 111, i32 106, i32 102, i32 92, i32 75, i32 58, i32 51, i32 54, i32 56, i32 44, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@output = global [720 x i32] [i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1], align 4
@.str = private unnamed_addr constant [10 x i8] c"%d != %d\0A\00", align 1
@.str2 = private unnamed_addr constant [15 x i8] c"%d   %d    %d\0A\00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"

; Function Attrs: noimplicitfloat nounwind
define i32 @main() #0 {
entry:
  br label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %fir_filter_int.exit, %entry
  %i.020 = phi i32 [ 0, %entry ], [ %inc, %fir_filter_int.exit ]
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %for.end.i
  %out.addr.053.i = phi i32* [ %incdec.ptr13.i, %for.end.i ], [ getelementptr inbounds ([720 x i32], [720 x i32]* @output, i32 0, i32 0), %for.body.i.preheader ]
  %coef_start.052.i = phi i32* [ %coef_start.1.i, %for.end.i ], [ getelementptr inbounds ([36 x i32], [36 x i32]* @fir_int, i32 0, i32 0), %for.body.i.preheader ]
  %in_ptr.051.i = phi i32* [ %in_ptr.1.i, %for.end.i ], [ getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 17), %for.body.i.preheader ]
  %acc_length.050.i = phi i32 [ %acc_length.2.i, %for.end.i ], [ 18, %for.body.i.preheader ]
  %i.049.i = phi i32 [ %inc22.i, %for.end.i ], [ 0, %for.body.i.preheader ]
  %incdec.ptr.i = getelementptr inbounds i32, i32* %coef_start.052.i, i32 1
  %0 = load i32, i32* %coef_start.052.i, align 4, !tbaa !1
  %1 = load i32, i32* %in_ptr.051.i, align 4, !tbaa !1
  %mul.i = mul nsw i32 %1, %0
  %cmp643.i = icmp sgt i32 %acc_length.050.i, 1
  br i1 %cmp643.i, label %for.body7.i.preheader, label %for.end.i

for.body7.i.preheader:                            ; preds = %for.body.i
  br label %for.body7.i

for.body7.i:                                      ; preds = %for.body7.i.preheader, %for.body7.i
  %in_ptr.051.pn.i = phi i32* [ %data_ptr.047.i, %for.body7.i ], [ %in_ptr.051.i, %for.body7.i.preheader ]
  %coef_ptr.046.i = phi i32* [ %incdec.ptr8.i, %for.body7.i ], [ %incdec.ptr.i, %for.body7.i.preheader ]
  %acc.045.i = phi i32 [ %add11.i, %for.body7.i ], [ %mul.i, %for.body7.i.preheader ]
  %j.044.i = phi i32 [ %inc.i, %for.body7.i ], [ 1, %for.body7.i.preheader ]
  %data_ptr.047.i = getelementptr inbounds i32, i32* %in_ptr.051.pn.i, i32 -1
  %incdec.ptr8.i = getelementptr inbounds i32, i32* %coef_ptr.046.i, i32 1
  %2 = load i32, i32* %coef_ptr.046.i, align 4, !tbaa !1
  %3 = load i32, i32* %data_ptr.047.i, align 4, !tbaa !1
  %mul10.i = mul nsw i32 %3, %2
  %add11.i = add nsw i32 %mul10.i, %acc.045.i
  %inc.i = add nuw nsw i32 %j.044.i, 1
  %exitcond.i = icmp eq i32 %inc.i, %acc_length.050.i
  br i1 %exitcond.i, label %for.end.i.loopexit, label %for.body7.i

for.end.i.loopexit:                               ; preds = %for.body7.i
  %add11.i.lcssa = phi i32 [ %add11.i, %for.body7.i ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %for.body.i
  %acc.0.lcssa.i = phi i32 [ %mul.i, %for.body.i ], [ %add11.i.lcssa, %for.end.i.loopexit ]
  %div.i = sdiv i32 %acc.0.lcssa.i, 285
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str2, i32 0, i32 0), i32 %acc.0.lcssa.i, i32 285, i32 %div.i) #2
  %incdec.ptr13.i = getelementptr inbounds i32, i32* %out.addr.053.i, i32 1
  store i32 %div.i, i32* %out.addr.053.i, align 4, !tbaa !1
  %cmp14.i = icmp eq i32* %in_ptr.051.i, getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 699)
  %cmp16.i = icmp slt i32 %acc_length.050.i, 35
  %inc18.i = zext i1 %cmp16.i to i32
  %incdec.ptr19.i = getelementptr inbounds i32, i32* %in_ptr.051.i, i32 1
  %acc_length.2.v.i = select i1 %cmp14.i, i32 -1, i32 %inc18.i
  %acc_length.2.i = add i32 %acc_length.2.v.i, %acc_length.050.i
  %in_ptr.1.i = select i1 %cmp14.i, i32* getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 699), i32* %incdec.ptr19.i
  %coef_start.1.i = select i1 %cmp14.i, i32* %incdec.ptr.i, i32* %coef_start.052.i
  %inc22.i = add nuw nsw i32 %i.049.i, 1
  %exitcond54.i = icmp eq i32 %inc22.i, 700
  br i1 %exitcond54.i, label %fir_filter_int.exit, label %for.body.i

fir_filter_int.exit:                              ; preds = %for.end.i
  %inc = add nuw nsw i32 %i.020, 1
  %exitcond = icmp eq i32 %inc, 200
  br i1 %exitcond, label %for.body3.preheader, label %for.body.i.preheader

for.body3.preheader:                              ; preds = %fir_filter_int.exit
  br label %for.body3

for.cond1:                                        ; preds = %for.body3
  %cmp2 = icmp slt i32 %inc9, 700
  br i1 %cmp2, label %for.body3, label %for.end10

for.body3:                                        ; preds = %for.body3.preheader, %for.cond1
  %i.119 = phi i32 [ %inc9, %for.cond1 ], [ 0, %for.body3.preheader ]
  %arrayidx = getelementptr inbounds [720 x i32], [720 x i32]* @output, i32 0, i32 %i.119
  %4 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %arrayidx4 = getelementptr inbounds [720 x i32], [720 x i32]* @out_data, i32 0, i32 %i.119
  %5 = load i32, i32* %arrayidx4, align 4, !tbaa !1
  %cmp5 = icmp eq i32 %4, %5
  %inc9 = add nuw nsw i32 %i.119, 1
  br i1 %cmp5, label %for.cond1, label %if.then

if.then:                                          ; preds = %for.body3
  %.lcssa34 = phi i32 [ %5, %for.body3 ]
  %.lcssa = phi i32 [ %4, %for.body3 ]
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 %.lcssa, i32 %.lcssa34) #2
  br label %return

for.end10:                                        ; preds = %for.cond1
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.end10, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.end10 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind
define void @fir_filter_int(i32* readonly %in, i32* nocapture %out, i32 %in_len, i32* nocapture readonly %coef, i32 %coef_len, i32 %scale) #0 {
entry:
  %add = add nsw i32 %coef_len, 1
  %shr = ashr i32 %add, 1
  %add.ptr.sum = add i32 %in_len, -1
  %add.ptr1 = getelementptr inbounds i32, i32* %in, i32 %add.ptr.sum
  %cmp48 = icmp sgt i32 %in_len, 0
  br i1 %cmp48, label %for.body.lr.ph, label %for.end23

for.body.lr.ph:                                   ; preds = %entry
  %add.ptr2.sum = add nsw i32 %shr, -1
  %add.ptr3 = getelementptr inbounds i32, i32* %in, i32 %add.ptr2.sum
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.lr.ph
  %out.addr.053 = phi i32* [ %out, %for.body.lr.ph ], [ %incdec.ptr13, %for.end ]
  %coef_start.052 = phi i32* [ %coef, %for.body.lr.ph ], [ %coef_start.1, %for.end ]
  %in_ptr.051 = phi i32* [ %add.ptr3, %for.body.lr.ph ], [ %in_ptr.1, %for.end ]
  %acc_length.050 = phi i32 [ %shr, %for.body.lr.ph ], [ %acc_length.2, %for.end ]
  %i.049 = phi i32 [ 0, %for.body.lr.ph ], [ %inc22, %for.end ]
  %incdec.ptr = getelementptr inbounds i32, i32* %coef_start.052, i32 1
  %0 = load i32, i32* %coef_start.052, align 4, !tbaa !1
  %1 = load i32, i32* %in_ptr.051, align 4, !tbaa !1
  %mul = mul nsw i32 %1, %0
  %cmp643 = icmp sgt i32 %acc_length.050, 1
  br i1 %cmp643, label %for.body7.preheader, label %for.end

for.body7.preheader:                              ; preds = %for.body
  br label %for.body7

for.body7:                                        ; preds = %for.body7.preheader, %for.body7
  %in_ptr.051.pn = phi i32* [ %data_ptr.047, %for.body7 ], [ %in_ptr.051, %for.body7.preheader ]
  %coef_ptr.046 = phi i32* [ %incdec.ptr8, %for.body7 ], [ %incdec.ptr, %for.body7.preheader ]
  %acc.045 = phi i32 [ %add11, %for.body7 ], [ %mul, %for.body7.preheader ]
  %j.044 = phi i32 [ %inc, %for.body7 ], [ 1, %for.body7.preheader ]
  %data_ptr.047 = getelementptr inbounds i32, i32* %in_ptr.051.pn, i32 -1
  %incdec.ptr8 = getelementptr inbounds i32, i32* %coef_ptr.046, i32 1
  %2 = load i32, i32* %coef_ptr.046, align 4, !tbaa !1
  %3 = load i32, i32* %data_ptr.047, align 4, !tbaa !1
  %mul10 = mul nsw i32 %3, %2
  %add11 = add nsw i32 %mul10, %acc.045
  %inc = add nuw nsw i32 %j.044, 1
  %exitcond = icmp eq i32 %inc, %acc_length.050
  br i1 %exitcond, label %for.end.loopexit, label %for.body7

for.end.loopexit:                                 ; preds = %for.body7
  %add11.lcssa = phi i32 [ %add11, %for.body7 ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %acc.0.lcssa = phi i32 [ %mul, %for.body ], [ %add11.lcssa, %for.end.loopexit ]
  %div = sdiv i32 %acc.0.lcssa, %scale
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str2, i32 0, i32 0), i32 %acc.0.lcssa, i32 %scale, i32 %div) #2
  %incdec.ptr13 = getelementptr inbounds i32, i32* %out.addr.053, i32 1
  store i32 %div, i32* %out.addr.053, align 4, !tbaa !1
  %cmp14 = icmp eq i32* %in_ptr.051, %add.ptr1
  %cmp16 = icmp slt i32 %acc_length.050, %coef_len
  %inc18 = zext i1 %cmp16 to i32
  %incdec.ptr19 = getelementptr inbounds i32, i32* %in_ptr.051, i32 1
  %acc_length.2.v = select i1 %cmp14, i32 -1, i32 %inc18
  %acc_length.2 = add i32 %acc_length.050, %acc_length.2.v
  %in_ptr.1 = select i1 %cmp14, i32* %in_ptr.051, i32* %incdec.ptr19
  %coef_start.1 = select i1 %cmp14, i32* %incdec.ptr, i32* %coef_start.052
  %inc22 = add nuw nsw i32 %i.049, 1
  %exitcond54 = icmp eq i32 %inc22, %in_len
  br i1 %exitcond54, label %for.end23.loopexit, label %for.body

for.end23.loopexit:                               ; preds = %for.end
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  ret void
}

; Function Attrs: noimplicitfloat nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { noimplicitfloat nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noimplicitfloat nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
