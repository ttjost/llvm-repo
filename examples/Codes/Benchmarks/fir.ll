; ModuleID = 'fir.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@fir_int = global [36 x i32] [i32 -2, i32 1, i32 4, i32 3, i32 -2, i32 -4, i32 2, i32 7, i32 0, i32 -9, i32 -4, i32 12, i32 11, i32 -14, i32 -26, i32 15, i32 89, i32 127, i32 89, i32 15, i32 -26, i32 -14, i32 11, i32 12, i32 -4, i32 -9, i32 0, i32 7, i32 2, i32 -4, i32 -2, i32 3, i32 4, i32 1, i32 -2, i32 0], align 4
@in_data = global [701 x i32] [i32 0, i32 0, i32 0, i32 0, i32 127, i32 121, i32 114, i32 121, i32 13, i32 13, i32 0, i32 3, i32 5, i32 2, i32 3, i32 127, i32 127, i32 2, i32 126, i32 0, i32 1, i32 126, i32 1, i32 1, i32 127, i32 0, i32 127, i32 0, i32 2, i32 1, i32 1, i32 3, i32 1, i32 127, i32 1, i32 0, i32 1, i32 1, i32 125, i32 123, i32 115, i32 106, i32 119, i32 16, i32 14, i32 1, i32 5, i32 5, i32 5, i32 5, i32 125, i32 0, i32 2, i32 125, i32 0, i32 0, i32 126, i32 1, i32 126, i32 127, i32 3, i32 124, i32 126, i32 6, i32 0, i32 126, i32 3, i32 2, i32 127, i32 126, i32 127, i32 2, i32 1, i32 127, i32 1, i32 1, i32 0, i32 3, i32 0, i32 127, i32 2, i32 0, i32 127, i32 3, i32 1, i32 0, i32 0, i32 125, i32 0, i32 3, i32 0, i32 126, i32 127, i32 2, i32 1, i32 126, i32 0, i32 3, i32 127, i32 125, i32 1, i32 1, i32 1, i32 127, i32 0, i32 5, i32 0, i32 127, i32 2, i32 126, i32 127, i32 2, i32 1, i32 0, i32 126, i32 0, i32 5, i32 0, i32 127, i32 0, i32 126, i32 1, i32 0, i32 125, i32 1, i32 3, i32 127, i32 0, i32 0, i32 126, i32 2, i32 3, i32 126, i32 125, i32 114, i32 104, i32 113, i32 5, i32 12, i32 7, i32 2, i32 6, i32 13, i32 5, i32 125, i32 3, i32 2, i32 127, i32 0, i32 121, i32 122, i32 3, i32 126, i32 125, i32 0, i32 125, i32 2, i32 1, i32 125, i32 8, i32 3, i32 124, i32 6, i32 0, i32 122, i32 6, i32 2, i32 124, i32 3, i32 126, i32 121, i32 6, i32 5, i32 116, i32 127, i32 13, i32 122, i32 120, i32 6, i32 5, i32 1, i32 0, i32 125, i32 1, i32 4, i32 124, i32 127, i32 3, i32 127, i32 5, i32 3, i32 122, i32 6, i32 10, i32 118, i32 124, i32 10, i32 124, i32 127, i32 6, i32 121, i32 3, i32 12, i32 117, i32 120, i32 10, i32 0, i32 121, i32 3, i32 126, i32 124, i32 6, i32 0, i32 121, i32 2, i32 126, i32 127, i32 6, i32 118, i32 127, i32 13, i32 121, i32 127, i32 6, i32 121, i32 6, i32 3, i32 113, i32 6, i32 10, i32 115, i32 127, i32 10, i32 0, i32 127, i32 122, i32 124, i32 10, i32 0, i32 117, i32 127, i32 12, i32 10, i32 124, i32 121, i32 9, i32 13, i32 125, i32 122, i32 5, i32 11, i32 10, i32 121, i32 124, i32 22, i32 3, i32 114, i32 13, i32 7, i32 121, i32 12, i32 7, i32 122, i32 11, i32 7, i32 122, i32 10, i32 7, i32 121, i32 10, i32 5, i32 117, i32 6, i32 5, i32 121, i32 5, i32 6, i32 1, i32 6, i32 0, i32 122, i32 2, i32 7, i32 3, i32 125, i32 1, i32 10, i32 7, i32 2, i32 127, i32 127, i32 9, i32 7, i32 121, i32 121, i32 6, i32 8, i32 125, i32 122, i32 6, i32 12, i32 6, i32 125, i32 127, i32 13, i32 7, i32 121, i32 1, i32 6, i32 127, i32 127, i32 2, i32 3, i32 1, i32 126, i32 1, i32 1, i32 125, i32 1, i32 0, i32 125, i32 6, i32 3, i32 125, i32 5, i32 7, i32 127, i32 124, i32 1, i32 6, i32 6, i32 124, i32 122, i32 7, i32 10, i32 0, i32 120, i32 1, i32 8, i32 0, i32 121, i32 122, i32 4, i32 10, i32 0, i32 120, i32 1, i32 6, i32 122, i32 117, i32 122, i32 0, i32 0, i32 121, i32 118, i32 127, i32 7, i32 0, i32 122, i32 125, i32 2, i32 4, i32 124, i32 122, i32 2, i32 5, i32 124, i32 122, i32 125, i32 127, i32 0, i32 120, i32 117, i32 127, i32 0, i32 121, i32 120, i32 121, i32 1, i32 3, i32 121, i32 121, i32 0, i32 0, i32 127, i32 127, i32 121, i32 127, i32 2, i32 122, i32 124, i32 125, i32 124, i32 127, i32 125, i32 121, i32 125, i32 0, i32 121, i32 122, i32 124, i32 125, i32 0, i32 125, i32 125, i32 0, i32 0, i32 0, i32 0, i32 125, i32 125, i32 0, i32 125, i32 126, i32 0, i32 126, i32 3, i32 3, i32 125, i32 1, i32 5, i32 0, i32 126, i32 125, i32 127, i32 3, i32 125, i32 121, i32 1, i32 2, i32 125, i32 127, i32 1, i32 0, i32 0, i32 127, i32 127, i32 126, i32 127, i32 0, i32 127, i32 0, i32 124, i32 125, i32 0, i32 121, i32 120, i32 124, i32 124, i32 123, i32 123, i32 125, i32 127, i32 0, i32 0, i32 127, i32 0, i32 1, i32 2, i32 0, i32 127, i32 0, i32 0, i32 0, i32 127, i32 126, i32 0, i32 0, i32 127, i32 0, i32 2, i32 1, i32 2, i32 6, i32 5, i32 3, i32 6, i32 8, i32 5, i32 2, i32 1, i32 1, i32 3, i32 0, i32 125, i32 127, i32 0, i32 127, i32 126, i32 0, i32 2, i32 3, i32 2, i32 1, i32 2, i32 3, i32 1, i32 124, i32 125, i32 0, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 127, i32 2, i32 3, i32 1, i32 0, i32 4, i32 6, i32 5, i32 6, i32 7, i32 10, i32 10, i32 4, i32 2, i32 5, i32 8, i32 9, i32 8, i32 7, i32 12, i32 20, i32 20, i32 16, i32 14, i32 20, i32 21, i32 15, i32 9, i32 7, i32 4, i32 126, i32 118, i32 100, i32 65, i32 72, i32 125, i32 108, i32 61, i32 103, i32 16, i32 6, i32 125, i32 117, i32 7, i32 29, i32 0, i32 108, i32 2, i32 125, i32 120, i32 119, i32 111, i32 119, i32 1, i32 0, i32 2, i32 7, i32 10, i32 28, i32 28, i32 23, i32 35, i32 47, i32 65, i32 67, i32 79, i32 85, i32 88, i32 126, i32 2, i32 76, i32 16, i32 105, i32 44, i32 13, i32 116, i32 42, i32 116, i32 99, i32 41, i32 124, i32 94, i32 33, i32 53, i32 70, i32 36, i32 103, i32 53, i32 60, i32 60, i32 38, i32 38, i32 47, i32 71, i32 100, i32 4, i32 19, i32 24, i32 39, i32 43, i32 48, i32 27, i32 127, i32 120, i32 114, i32 104, i32 92, i32 90, i32 104, i32 124, i32 3, i32 13, i32 38, i32 65, i32 81, i32 90, i32 106, i32 108, i32 84, i32 120, i32 9, i32 69, i32 121, i32 31, i32 11, i32 46, i32 96, i32 11, i32 102, i32 127, i32 104, i32 119, i32 78, i32 70, i32 74, i32 59, i32 18, i32 91, i32 55, i32 49, i32 33, i32 11, i32 18, i32 46, i32 87, i32 126, i32 25, i32 34, i32 43, i32 63, i32 58, i32 37, i32 11, i32 121, i32 113, i32 104, i32 97, i32 92, i32 102, i32 114, i32 6, i32 22, i32 41, i32 65, i32 94, i32 109, i32 102, i32 96, i32 110, i32 23, i32 72, i32 54, i32 18, i32 23, i32 47, i32 99, i32 120, i32 92, i32 119, i32 108, i32 117, i32 65, i32 73, i32 79, i32 59, i32 11, i32 84, i32 55, i32 0], align 4
@out_data = global [720 x i32] [i32 3, i32 -6, i32 -3, i32 29, i32 88, i32 137, i32 135, i32 86, i32 32, i32 7, i32 7, i32 4, i32 -7, i32 0, i32 40, i32 91, i32 107, i32 79, i32 43, i32 33, i32 45, i32 48, i32 39, i32 39, i32 55, i32 71, i32 66, i32 39, i32 8, i32 -12, i32 -11, i32 13, i32 46, i32 59, i32 37, i32 0, i32 -8, i32 29, i32 89, i32 131, i32 135, i32 111, i32 78, i32 47, i32 18, i32 -1, i32 -5, i32 4, i32 21, i32 35, i32 45, i32 49, i32 47, i32 41, i32 38, i32 42, i32 54, i32 72, i32 88, i32 95, i32 90, i32 79, i32 70, i32 65, i32 50, i32 27, i32 23, i32 55, i32 105, i32 123, i32 89, i32 47, i32 36, i32 48, i32 42, i32 8, i32 -10, i32 7, i32 36, i32 49, i32 47, i32 51, i32 50, i32 30, i32 4, i32 7, i32 35, i32 51, i32 33, i32 14, i32 30, i32 74, i32 97, i32 75, i32 33, i32 14, i32 34, i32 73, i32 94, i32 77, i32 37, i32 11, i32 24, i32 50, i32 51, i32 21, i32 5, i32 41, i32 100, i32 118, i32 77, i32 22, i32 9, i32 38, i32 55, i32 35, i32 11, i32 21, i32 60, i32 82, i32 64, i32 35, i32 29, i32 45, i32 54, i32 45, i32 36, i32 41, i32 50, i32 44, i32 33, i32 43, i32 80, i32 123, i32 141, i32 115, i32 71, i32 34, i32 15, i32 7, i32 -1, i32 0, i32 19, i32 45, i32 54, i32 43, i32 35, i32 50, i32 78, i32 92, i32 85, i32 79, i32 85, i32 92, i32 80, i32 52, i32 32, i32 34, i32 50, i32 56, i32 47, i32 37, i32 42, i32 53, i32 50, i32 35, i32 31, i32 54, i32 87, i32 96, i32 76, i32 49, i32 45, i32 64, i32 87, i32 103, i32 103, i32 76, i32 33, i32 4, i32 8, i32 32, i32 48, i32 44, i32 51, i32 78, i32 97, i32 86, i32 57, i32 38, i32 38, i32 43, i32 46, i32 56, i32 74, i32 87, i32 88, i32 92, i32 95, i32 80, i32 49, i32 29, i32 49, i32 88, i32 93, i32 55, i32 22, i32 35, i32 85, i32 113, i32 86, i32 40, i32 24, i32 48, i32 81, i32 96, i32 92, i32 82, i32 79, i32 84, i32 94, i32 98, i32 87, i32 69, i32 58, i32 53, i32 38, i32 23, i32 35, i32 71, i32 93, i32 72, i32 39, i32 48, i32 97, i32 121, i32 90, i32 49, i32 45, i32 69, i32 79, i32 65, i32 62, i32 72, i32 72, i32 58, i32 61, i32 83, i32 85, i32 47, i32 13, i32 31, i32 85, i32 105, i32 71, i32 30, i32 28, i32 50, i32 60, i32 49, i32 40, i32 45, i32 52, i32 50, i32 46, i32 46, i32 47, i32 45, i32 47, i32 50, i32 47, i32 38, i32 35, i32 48, i32 61, i32 44, i32 3, i32 -17, i32 10, i32 52, i32 57, i32 24, i32 10, i32 40, i32 66, i32 40, i32 -5, i32 -2, i32 55, i32 97, i32 83, i32 50, i32 53, i32 75, i32 76, i32 54, i32 54, i32 78, i32 86, i32 51, i32 14, i32 27, i32 78, i32 105, i32 81, i32 34, i32 13, i32 36, i32 75, i32 94, i32 77, i32 42, i32 18, i32 22, i32 41, i32 53, i32 51, i32 42, i32 37, i32 38, i32 47, i32 56, i32 49, i32 29, i32 29, i32 66, i32 104, i32 88, i32 26, i32 -1, i32 42, i32 99, i32 95, i32 39, i32 10, i32 34, i32 52, i32 30, i32 11, i32 39, i32 88, i32 90, i32 46, i32 16, i32 27, i32 40, i32 35, i32 49, i32 96, i32 124, i32 86, i32 27, i32 29, i32 93, i32 129, i32 92, i32 41, i32 44, i32 78, i32 81, i32 53, i32 51, i32 77, i32 83, i32 50, i32 36, i32 80, i32 134, i32 133, i32 90, i32 70, i32 93, i32 107, i32 91, i32 79, i32 99, i32 113, i32 84, i32 42, i32 44, i32 80, i32 86, i32 48, i32 30, i32 77, i32 141, i32 144, i32 91, i32 58, i32 85, i32 128, i32 137, i32 120, i32 123, i32 138, i32 125, i32 83, i32 62, i32 91, i32 131, i32 127, i32 89, i32 74, i32 91, i32 94, i32 46, i32 -12, i32 -13, i32 45, i32 95, i32 97, i32 80, i32 84, i32 94, i32 80, i32 48, i32 38, i32 52, i32 50, i32 24, i32 9, i32 39, i32 91, i32 116, i32 109, i32 94, i32 82, i32 64, i32 45, i32 52, i32 84, i32 92, i32 49, i32 0, i32 10, i32 86, i32 156, i32 150, i32 89, i32 46, i32 56, i32 87, i32 94, i32 75, i32 70, i32 94, i32 120, i32 124, i32 119, i32 128, i32 141, i32 125, i32 79, i32 43, i32 43, i32 51, i32 30, i32 0, i32 6, i32 40, i32 55, i32 29, i32 9, i32 36, i32 83, i32 93, i32 61, i32 31, i32 33, i32 41, i32 24, i32 -4, i32 -11, i32 6, i32 18, i32 9, i32 -3, i32 1, i32 15, i32 12, i32 -6, i32 -14, i32 9, i32 50, i32 77, i32 86, i32 92, i32 98, i32 83, i32 39, i32 0, i32 -4, i32 12, i32 8, i32 -16, i32 -7, i32 54, i32 106, i32 85, i32 28, i32 27, i32 96, i32 142, i32 97, i32 21, i32 20, i32 94, i32 140, i32 97, i32 29, i32 26, i32 82, i32 107, i32 61, i32 -5, i32 -24, i32 1, i32 21, i32 12, i32 -2, i32 0, i32 13, i32 17, i32 9, i32 1, i32 1, i32 7, i32 12, i32 11, i32 7, i32 6, i32 13, i32 22, i32 23, i32 16, i32 12, i32 19, i32 28, i32 19, i32 0, i32 0, i32 38, i32 95, i32 123, i32 104, i32 72, i32 72, i32 104, i32 125, i32 96, i32 45, i32 25, i32 55, i32 92, i32 90, i32 49, i32 15, i32 19, i32 49, i32 76, i32 94, i32 113, i32 131, i32 127, i32 88, i32 32, i32 -3, i32 -8, i32 9, i32 24, i32 25, i32 22, i32 25, i32 39, i32 55, i32 61, i32 66, i32 79, i32 98, i32 101, i32 79, i32 51, i32 44, i32 54, i32 61, i32 56, i32 52, i32 64, i32 84, i32 93, i32 91, i32 88, i32 89, i32 83, i32 65, i32 50, i32 51, i32 63, i32 74, i32 75, i32 67, i32 51, i32 37, i32 40, i32 61, i32 79, i32 68, i32 35, i32 14, i32 22, i32 41, i32 44, i32 40, i32 57, i32 99, i32 132, i32 125, i32 95, i32 86, i32 105, i32 115, i32 86, i32 36, i32 12, i32 30, i32 64, i32 86, i32 96, i32 105, i32 110, i32 99, i32 78, i32 66, i32 68, i32 71, i32 59, i32 42, i32 34, i32 45, i32 69, i32 93, i32 112, i32 119, i32 109, i32 91, i32 74, i32 63, i32 55, i32 50, i32 57, i32 67, i32 61, i32 32, i32 5, i32 16, i32 63, i32 100, i32 90, i32 52, i32 33, i32 46, i32 62, i32 51, i32 34, i32 48, i32 89, i32 117, i32 113, i32 96, i32 97, i32 103, i32 85, i32 45, i32 18, i32 29, i32 67, i32 101, i32 113, i32 108, i32 95, i32 83, i32 71, i32 57, i32 41, i32 28, i32 30, i32 53, i32 86, i32 111, i32 116, i32 111, i32 106, i32 102, i32 92, i32 75, i32 58, i32 51, i32 54, i32 56, i32 44, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@output = global [720 x i32] [i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1], align 4

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 200
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @fir_filter_int(i32* getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 0), i32* getelementptr inbounds ([720 x i32], [720 x i32]* @output, i32 0, i32 0), i32 signext 700, i32* getelementptr inbounds ([36 x i32], [36 x i32]* @fir_int, i32 0, i32 0), i32 signext 35, i32 signext 285)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc6, %for.end
  %2 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %2, 700
  br i1 %cmp2, label %for.body3, label %for.end8

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [720 x i32], [720 x i32]* @output, i32 0, i32 %3
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [720 x i32], [720 x i32]* @out_data, i32 0, i32 %5
  %6 = load i32, i32* %arrayidx4, align 4
  %cmp5 = icmp ne i32 %4, %6
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body3
  br label %for.inc6

for.inc6:                                         ; preds = %if.end
  %7 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %7, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond1

for.end8:                                         ; preds = %for.cond1
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end8, %if.then
  %8 = load i32, i32* %retval
  ret i32 %8
}

; Function Attrs: nounwind
define void @fir_filter_int(i32* %in, i32* %out, i32 signext %in_len, i32* %coef, i32 signext %coef_len, i32 signext %scale) #0 {
entry:
  %in.addr = alloca i32*, align 4
  %out.addr = alloca i32*, align 4
  %in_len.addr = alloca i32, align 4
  %coef.addr = alloca i32*, align 4
  %coef_len.addr = alloca i32, align 4
  %scale.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %coef_len2 = alloca i32, align 4
  %acc_length = alloca i32, align 4
  %acc = alloca i32, align 4
  %in_ptr = alloca i32*, align 4
  %data_ptr = alloca i32*, align 4
  %coef_start = alloca i32*, align 4
  %coef_ptr = alloca i32*, align 4
  %in_end = alloca i32*, align 4
  store i32* %in, i32** %in.addr, align 4
  store i32* %out, i32** %out.addr, align 4
  store i32 %in_len, i32* %in_len.addr, align 4
  store i32* %coef, i32** %coef.addr, align 4
  store i32 %coef_len, i32* %coef_len.addr, align 4
  store i32 %scale, i32* %scale.addr, align 4
  %0 = load i32*, i32** %coef.addr, align 4
  store i32* %0, i32** %coef_start, align 4
  %1 = load i32, i32* %coef_len.addr, align 4
  %add = add nsw i32 %1, 1
  %shr = ashr i32 %add, 1
  store i32 %shr, i32* %coef_len2, align 4
  %2 = load i32*, i32** %in.addr, align 4
  %3 = load i32, i32* %in_len.addr, align 4
  %add.ptr = getelementptr inbounds i32, i32* %2, i32 %3
  %add.ptr1 = getelementptr inbounds i32, i32* %add.ptr, i32 -1
  store i32* %add.ptr1, i32** %in_end, align 4
  %4 = load i32*, i32** %in.addr, align 4
  %5 = load i32, i32* %coef_len2, align 4
  %add.ptr2 = getelementptr inbounds i32, i32* %4, i32 %5
  %add.ptr3 = getelementptr inbounds i32, i32* %add.ptr2, i32 -1
  store i32* %add.ptr3, i32** %in_ptr, align 4
  %6 = load i32, i32* %coef_len2, align 4
  store i32 %6, i32* %acc_length, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc20, %entry
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %in_len.addr, align 4
  %cmp = icmp slt i32 %7, %8
  br i1 %cmp, label %for.body, label %for.end22

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %in_ptr, align 4
  store i32* %9, i32** %data_ptr, align 4
  %10 = load i32*, i32** %coef_start, align 4
  store i32* %10, i32** %coef_ptr, align 4
  %11 = load i32*, i32** %coef_ptr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %11, i32 1
  store i32* %incdec.ptr, i32** %coef_ptr, align 4
  %12 = load i32, i32* %11, align 4
  %13 = load i32*, i32** %data_ptr, align 4
  %incdec.ptr4 = getelementptr inbounds i32, i32* %13, i32 -1
  store i32* %incdec.ptr4, i32** %data_ptr, align 4
  %14 = load i32, i32* %13, align 4
  %mul = mul nsw i32 %12, %14
  store i32 %mul, i32* %acc, align 4
  store i32 1, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %15 = load i32, i32* %j, align 4
  %16 = load i32, i32* %acc_length, align 4
  %cmp6 = icmp slt i32 %15, %16
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %17 = load i32*, i32** %coef_ptr, align 4
  %incdec.ptr8 = getelementptr inbounds i32, i32* %17, i32 1
  store i32* %incdec.ptr8, i32** %coef_ptr, align 4
  %18 = load i32, i32* %17, align 4
  %19 = load i32*, i32** %data_ptr, align 4
  %incdec.ptr9 = getelementptr inbounds i32, i32* %19, i32 -1
  store i32* %incdec.ptr9, i32** %data_ptr, align 4
  %20 = load i32, i32* %19, align 4
  %mul10 = mul nsw i32 %18, %20
  %21 = load i32, i32* %acc, align 4
  %add11 = add nsw i32 %21, %mul10
  store i32 %add11, i32* %acc, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %22 = load i32, i32* %j, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  %23 = load i32, i32* %acc, align 4
  %24 = load i32, i32* %scale.addr, align 4
  %div = sdiv i32 %23, %24
  %25 = load i32*, i32** %out.addr, align 4
  %incdec.ptr12 = getelementptr inbounds i32, i32* %25, i32 1
  store i32* %incdec.ptr12, i32** %out.addr, align 4
  store i32 %div, i32* %25, align 4
  %26 = load i32*, i32** %in_ptr, align 4
  %27 = load i32*, i32** %in_end, align 4
  %cmp13 = icmp eq i32* %26, %27
  br i1 %cmp13, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  %28 = load i32, i32* %acc_length, align 4
  %dec = add nsw i32 %28, -1
  store i32 %dec, i32* %acc_length, align 4
  %29 = load i32*, i32** %coef_start, align 4
  %incdec.ptr14 = getelementptr inbounds i32, i32* %29, i32 1
  store i32* %incdec.ptr14, i32** %coef_start, align 4
  br label %if.end19

if.else:                                          ; preds = %for.end
  %30 = load i32, i32* %acc_length, align 4
  %31 = load i32, i32* %coef_len.addr, align 4
  %cmp15 = icmp slt i32 %30, %31
  br i1 %cmp15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.else
  %32 = load i32, i32* %acc_length, align 4
  %inc17 = add nsw i32 %32, 1
  store i32 %inc17, i32* %acc_length, align 4
  br label %if.end

if.end:                                           ; preds = %if.then16, %if.else
  %33 = load i32*, i32** %in_ptr, align 4
  %incdec.ptr18 = getelementptr inbounds i32, i32* %33, i32 1
  store i32* %incdec.ptr18, i32** %in_ptr, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.end, %if.then
  br label %for.inc20

for.inc20:                                        ; preds = %if.end19
  %34 = load i32, i32* %i, align 4
  %inc21 = add nsw i32 %34, 1
  store i32 %inc21, i32* %i, align 4
  br label %for.cond

for.end22:                                        ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
