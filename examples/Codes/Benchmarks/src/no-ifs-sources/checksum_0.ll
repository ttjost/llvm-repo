; ModuleID = 'checksum.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@msg1 = global [4000 x i8] c"`8z\BE\F6:\B7\03>m+K#M/X\08\07\F2\F1\0FpX\F6\988\1F\B4\08_Cz\CB\E7\A4l\9B\CA\E5\96\01.\96D\1C\D6\94\90\A0\DC\AF;!\9D\8E\C0\91\F3\CF\A6\07\A9r\15\C1+w\ACl}\C4\91\A2nL\C9\B3\0Cn\C8\A7Z\9AK\83@:f\CB\C2\CE\D8HtY\A6\0B-\FB\E6\B1\FA\DF\DB\E7VVB0\97D\EB\E5\AA\BA\8A}\02\E4\CE\0E\CD%\B3\14h\80\14p\159\83\B2\EB\BB\5C\9A\0D\BC\17\DB\1E\9E\DE#\F4\18_W\8B\15\E2#;\DC\9D\B1-pG\B7\0B9\EA\B7\F6\E3\FD\82\BD\85\B1\FDJ\06\8B'_\BC2Z\82U\8A\D06\FA\00hk\B1'\AA6\02\84\08\C4\DD\A5f\8C\BAx\DC\C4\01\D9\BA\15\ADl\CC\91+\AC\DE\E4\87D\82\C9\CA\9D\10\C0\9D\B7\ED\FD1<\10\A3b\D2\C21\1A\B0\A4<\F3t\F6^ 2\15n\8D\D0E\F1C\90\B1\CF\11\ED\AFIh\ABG*\86)\F5<\D7\F9\AE\FD\97\B2 \92\BB\04>\FC\11\0C\FB\89\A6\E8T\8Cg\8E\94P\0A\D9\D3I.\E4\BF\8C\C0\9B\9E\80\A1\8E\93\D5\85\08\1F\B5\1E`\EA:x\8E\C3\1F\A6\00\E5\B9\9E\AE|'alg\C8^~>\ED\18q\95\CF\06(\82\C3\B94\5C\ABDi\C5\AF\D7\AD\EB-\AD\13\0A\ED('4\999\8BTk\05\C2p(\C5K-L\ED\F1\98\86\90a#f\02\FD\ECT\BE\EFE\C4\8A\7Fp\A7\D8\A9\AA$o\EAj\87JZ\EAy\C0\FF\E6q\E4_\A3j.V2\D6Z*\F5\D2\90\DCb\9A\C4\C0\06>_O\CD\95\1E<\80r:\C4\8E\15\C9J\0E\E4d\22\04[\08\AC\E2?A\A5R\19\84\B92\E2\DC[\E0\FA\C9\D9\B6_d\AA\D8\1A\C7\0A,\FC\AB\C8\A9\8AQ^\D55\A6B\88\CE\A1{\F58\F0v\EA^\D2\19VgF\18\0C(e\88\C6\DA\0C\B1k\0C\BD'\94\DA\C6\1BL_\A3\EE\17g\A0\065i\C2\E5'\B3\E7wr\E7,\AA\A2\A5\8ED\91\89\D3\F0\E9X\AA\99\E6u\11\FA`\99\F6u\08\C2!$\F1lP.R\FE\A3[\89\87:\E9c\A9\1C\9F\9A\D5Z#\9E\B8s\88\98\F4\FA+\AB\13v\BE|\B8\88\A5\F4\16S\80D\A6\17\08)\14\1F\1Eqy\DD!\BD\CFR\7F\87\A1\B3\8Ef\02I\9C\90\BF\98D\A0\D7\C3\03\9A+.\0A+qeU4n<\FB\89d6\C8\F5\C8*\08\818#\A5\F5\AB\88t\9F\E9|\CBR>\87V\B1ju*\AD\DB~\1AK\1D\A6I\AA\91f\00D\5C\8C\C2t\A2_\9C7\F4\06\C06\06)T\03\A5\D8\87\A3\E7\AC\E6L\A3+\ECo#p\DF\F7\18\0B\D9\D3\CD%$\B2\9F\E8\CB\0D\AC\1Dmj\CB\16T\DD\BB\CD\C5\D2\9EM\99\0A\A7P\0C\E3\12)\D4\DBT\E4uV\94\AB\D3\9FYj\08,\83\B6w%\7F\EA!'\B6\937DE\0D\EFN\F3m\9AU_\A1\F6my\D6\C0\B43\19\8D\92w@\DAB[\0Ba\91\92\85\AE\E6%\B0\F0\81c`\14\07\16g\0F=\F7\F2{\14b2e\E5M>d\FCv7\EEZ\DB\AC\E6\B6o@x\C5\0A\8A)\BB\A0<)\10\B5\86\EB\87\10\BC\F7k\AE5\FE\1B\F9v.\C9:\90\C8~K\C6\EE`\90r\C17&(\AB-]\1B\F8\D5d\BF\ABnB\B0\8Fg\0D\D1\8B&U\B8:\04\E0I\BB\9C\9C\A0\C5E\D14\FD\DC\958\8B\C6\85D\EA4\B14\FF\A9\D8Pm\B8\D4\AD'\12W\D2F\C0\D7\9D\1B\AC\C6g\88e\06f\8B\22\9CS\1B\07\A3L7\A7\82\FB;\C9a\F6to\D8h\F7\13\E9\F1\AE30\CB\B3\10X-\E0\B1\D1\F3\A6.\BF~\1D*5\D8]\A0\A2\1C\0B\E3\8B\146\DFz#c\A46e\E6%3\14s<K-\F4\F0\AES\9C\FA\17\F2;\85@\A6\D36\98\DElk2\BC$\C6\FF?\89\EC?\A4*\894\08k\97\19R\99\E0QO>\C1\E3\1D\B5/&\CD\00\FF\B8D\D8a\B4a\05\AD#d\F0b\B2\8Duj\A5\03\FE\A2\0C\F7\CD\9A3\09\98\98^\EAZ\E3\B5Bg=}\D3\C1\B0\88\DD\AA\8D\EE\C4z\B1\FD\F0\B2\0Am\F4PY\D8\F1d9h<\E3_\D1>\BA\22\82\9B&=\16\96B\D4\10\B4\E1\B4\C8\9E\9D\DF\9FK/Fy^\01\D8l\CC\01\BB\B4\C1\B8\D8\EA\C4\9A\9Du\18\9F\FD@e\12\BB\AD\98\A8\E8\C8\07\D3\AA\C0\D7X>\92\A1\1F?\06SI'\DFT\87\16M\EB\A9\D2\A6\E1u\0FUd\BA\EF\12-\A4\CBS\E5P3\01\C4\A23o{V\D8\87TU\F2E\96I\1Ai-s\F6h\8A\BB\BB\A3\C8\08\F3\DA\0F\D1\7F\E3=\F4\DF\96\C2\C6\B1\0B\CBjw\07\A2f\9D\B2Ts\B9\8E\93\94\14\A4\DEih\FF\DE\C4\EB^\13|\8C$\AF\81{\93\C10\EF9\96\E9#\A9\5C\DD\A0n\07,\C2<w.ti\DA\10=\9BO\A3\80\C1\CBp\FFF@\0F\A0\84\FB\B8tvM\1A\F4\B2mk\8D\95\9C\C0]\BF\8A\9D?\C1\F8\D0\05\15\9Ez\03NNm\D4\8FX\BDXA0\91\FB\00N9=\D5U\85m\AAwT\B7\FA\17ka\C7\AF\87Q\D1\F3\B4\D2\046\DF\971\0D\AA\FF\011\7F\9A%\A9\E7\EB\D2(\1Col\B3\DC\DE\81\86\7F\B0\F88L\E2\89\1D\07\F9p\EB\CEF\5C\9F$l\AD\A1N\1F\DF&\DD.@\D5\8C\C2\E9\ACK\E7\EB%\9BL\C7\94\1CF$\D2d\1A\BB\1F\11{\95D!Qx\F8\80\BB\9E\84\E2W\A8\A9\D2\C0\D2\C1\0BXf#\06Fu\CC\D4\C2\C5:-\8F\05\9B\C8\C9G'\EC\E0\AE\C9F\E4f\04\FD\02\D4\14\03N\0ES\AE\C2\8D\DE\86\86!x`q$\AE\AB\CF\F2:\09d\98\AC!\B1\CAF\B3u\1A(\ECvg\AC\FB\80\93\13\E3\ADx`\92\E7\1B\843\AB\22\BA\BF\0F\834\DA\05~\F7\DC\E1\CC\02-\18\18\B5\D5J\AEqR\81r{\AC\BB\12%\C7\A5\7F/\F7\A9\98j\D9*(\9E`\0E\12\AD.|\CA\F7$\E6\07\00<I\B6P\95\B31\9A\CF\05\B0 \98\FA\FFU\87gq\C3(\C4\14/W\EA%\FA\D1\1E\C6\C9\07M\EEh5\99\A0\EB\B3\14_\16\8B\CA\E0\FEK\04\01\EF\1B\CB\FA\90\11\AB\D1E\C3\B8\13\D4\1D\D6\C0Ju4\86\1F\DC\182\98\B7\E1cl\8DJ\80\AA!\EB\EB\D9\C3\05v`\E2~\15(\E6*\D5\7F<K\0D?\B2[\D2/\04\08\AF\A8\B5\7F\95{#\ED\10\12\D5B\BB\D4\177\F6\CE\C9\92\D5\8Fr\A8[R\9B#\E7bZ\05\EE\BA,\EC\EA\EB\08\97\91B\B0\A8J)I\AB\DC\CD.Vh\01\00\12\99a\01\BA\19\BA\A2\A1F\A9Y\D9%\81\B8\B2\96r\BB\81\C9\E6a\A2\F0.}\BF5]\CDQ\EEtKf\0F\BF\C3\A5\E0}\A5\8F\EF\C6\1C\07G\A9^\13\E1\94E\E4Z\F8\1F\13\E6-\C1-\84\92\E2qs\F8\A5\D7\E3@wT\F0B\1B\5C\CB\F0\02\A89\BA\DF9A4{\9B!\F6\C5n\81\C4,\22\EB\ED1\01y\F77r\CF|\9D{KN\0E\87{\E1\17i\CF\EA\F9\A0\8FC\C0\DC\0E\11\93\C0 (N\EA\C8\ADM/6\FC\8A*\EF\CC\EA\F8M\91\D3<*!\01i\D8\9A\9A?S\81\7F\95\B9.\E4Y\F9h\22\D5\CBK\CB3\DFr\FFCYQ\FDz{\E2\FC=\A3\83;_x\1EW\E8`\8A\DB\1840\1D\AB7\F1G]CG\B3\B0D\AA|\EB\EA4Qf\9A\87\8C\05\A5\EE\83\01\BB\C2\1C\EE\A1\0E\A6\F8\22u\E7pBSq\87\B9#9X\9F i+c.t\F7\01\F9k(s^\8F\A3h\0A&\063`\924\06\A0\9E\10_D\1B\87\C1\AD\AB\D4\A7\FF\DC\FF\B5Hx\A50\E7\1A\FF\B0+\04\1C\14:0q\B53\A4\93\DD\97\0ABz\E4\7F\A9\0E\82\AA\E3\E9\E3\11\C1\9A\E5\A7\CA\A2z\A8\82k\8A\A9\EFx\17\EAX\DC\A2\EEO\F0\CDM\F2@A\C8m\C5\D1\9E\C2Y\DF\1D\CCg\FE{\80\E1\D8\E6vwR\D9\A7\05\ED\B0xLo~\F7\E4\C1\1Ecq\1B\87\F1\14]d\CD$\C0\E4^\1E\AD\CE\CE\D9\EC\D7\C9\FD\017\84\B6\D2y\00\A3\8D\92\8F\14\C85\97u\E9e\95\04\C7Kd\CA\91I\BF\C7\EEN\04ofl:U\FF\A7U&+\0E\B8\D8\E1\10\FA\22\09\07\EC.\1C\19\DB\8C\0B@\11j`\A6\A2\02\A35dR\FEn>\12#z\A5\E3m~d\C4E3\9B\C9\C7\B5\09\0D\A4\9A\8D\E8IE\E9]@|\C9\D6\D68\03\12\FE\BC ^u\E9\1B\02&\CFh\FE\CF\877\F6\E3?\F9i\B2\95#)\C7)1\07\90m\ED\CDD\BE\F0p\00\B8i\863\C5\1C\F5<\F7\AD\EDQ\18\1F\17\A2\FE\96\0E\BD\22d\0D4sB\EA|h\DDC\18S\94\F6\F5\FD\80\D6\18n\B4\9Av\0B\C5\18\22\E6\8C\B4\ADQ*\12\C9\B4L\12/\A0\AF\FD\C2#\E6\FB\F4]Z\C8hS\92\A7\D9\03\B5\969\B7L\C2\1D\9EK=W\98Q\ED\E4P.\C7\08\8F\A6=\B7\CFt\F47\0F\91\BA\02\E5\B5\B7\F0\D9\1E\E1\95\EF\8F\B5\E7\85\9B#$_\22\C9\F2\00\1Cd\C7;\95\83\8B\08\F8}z\9B\8F\A4O\B2J\BA\9E.\BE\A3\81\E5p\5Cv\B6T+\87\DC\90\17\AB\87\85\9Bl\A8\0E\96\C9\0C\0A\84]\AC\17\F3\C0B\A1/,\1F\1A?c;\8A\15\D0\8EJ\00\EC\9D\0Bd\E3W\1D\ADv!\EE\81#.\D04\82\14\FE\80\F1\9C\E0us\D9\8D\AE\D5{\92\C5\12d\F1\08\F8{ll\0A\C0\02\C1\A8\A1\BA'm\8B\9E\C0\D8\C3\0A\A6-u&\1F\9D\0D\B0\0F\A4\C5\FE\AD\B2~Cy\0D\D3\10m\F5k\1Er\08\8FJ\15\E7\FC\E0z\1A\F9\1B\900\AA\EC\86*\A6\FA}\19\C8\EA~\06B\DF\AD\11\F7D\BF\DC\08\C8\A8)\AF\AA\99\C1L6)\97\BD\8E\D1-\F2\AD\9E7\BF\A9!}\F48\A9\05\AAt\B4p\DF\E2\A1\A4E\B0\AA\ABV=\12\DA\AB\DF\9A5\8E\DF9\12\CD\C8\0B\FB\D1\E1\88\D8\EE\F7\F9M\FB_(a%:W_\00\FAr\00\DE%\87\C9dYu\B2Y\8F\E3\08\C1\A3t\93*\138\FBE\06eg\B7\90Ff14r\12\BD\A9Ar[\E1| \CCFS+\ADF\93>\C6\11\18\01\A3\A1\7F\BFd\FA H\D1\B3;\18\B1\B4p\B8[@tc\8D5\01\ED|\92\0E\E0+:@\E8\FF\F7\9Fp\93\C1\8C\8C\C9?\F2\19!\8D\BC\22M?\86\85\04\A5\96\D5\16P\0D\82\C0\D5Y7A\D0\ED\83\AC+4\BA\00\9F\C2\1Du{\CC8\18\A4\DA\8B\99\DC\BAlcF\B7+\ED)\0BwO\F4\91\FF\18\81\BE\5C^\9D\D2-\15\C8J\83\A48\98\7F\B5$\15:L>6\E4\1B\80\FE/\13+\B3\ED>\0C\D4\F7\CB\01IQj\BB\DC\8B\DA\C4\E7i\BF\C3O\C6\B8\FE\B0\B4\B1!\D9\E8u=zU\86\12\1C\160\91P\90\DB\9B+\D7\A1\0F\F1Q \03\0F\98\90PN\A4\17TE)[\F2\0F>Y\DD>?u\16\0F\F3\D1\B2\DE\F0\E1\E0\DC=>*\FE9\BB\FB8\BC\B6`\EB{\AF\12\9B\B0\1E\B4\E4\FA\80X\AE\81\B2G\9F]\83\01\D18\84\82\C41!\C7\96\03\F4\8FqfXfC\B5=\DE\B4\D0;\1FUC\E8\A2\14\A7n9\F8HWR\09\07\AA{\8F\82<(\7Fq?\B42S\1E\A5XI\8D4+@\DB\0B\E7V\8APxv!\E2uD?\E1M@\F3t\BF%K\C5\8F\92*Pv\EC^]Y\81\F1\CA\BE\F1\BF\0E{\C9Iz\AFp\C7\C0\F6F\83\B9\D7\09db\81{\C8'\B7A\97d\07\0E\94(A\00\F6;'I7aa\12+\E0\B3\9BS@q\A6rQ1\15ar\C2\D2\1F\0F]\EE,k\1A\0C\16\9F\A5\00S\E11\B2Q\09\ABH\CBQ3\84^\5C\C7i\5CyA$\DE(\83*\1F\DC\EF\9D\08\02\1D\F3\06B\C7\D9#\04\08TT5\C5*\0FJk\7F!\84\DA\C2\BDu\A0\C9\D7\C3j:\B2,\B6-\B8\CA\CD\0F\89\97\F0\C9U2\D1 n\E2D^\18\DB62\A3\C0\DD\D4\BBi1l\FE\E5\9A\B4\CF\C2\EA\DBi\8B\8C\AC7\91\FE\EFb\EE|\0F\AA\C7\FD\FCx\D0bR4\14\ED\BA\D4\F6\EF\90\B5r\C5\C6\AD\A8\04\07`\9B\F3\1F\D359\99>\8E\D7\A9%mWL\A9\0EE\AD\1B%\DE\CA\D1\22\07W=\B7\80\E2:\97Y7\A9\7F\A4\05<yk\C1\91_\E4\CA\82\9E\E3\CD\BB<\8Fj\8C\1BX\17\FF~(D-\CC\D8\C0\CD\94\E5[\0D\D1c\CB\A4n1\D3'\0Bm\A1\9C\01*wL\A3`\8E\DD\C7#6\9F\84\18A&<#\A1\18\DCePGbeo\01\9F\8C\B2\A7>\D6\FA|\04\C6C\BEX\9B\C0\FA\06\C0C\9C?\88\E2\C5\E4\1A\D7a\03\A9\A8w\A1\E8\87\C2\B9\BD\FA\81\844\BE\8B\FB\B6\E9\A5\99yN\17e:$}/*\E9\DA\19%\83\F2Y)\A9\D8<\05\80\C5mP\88+w\9C\B9\09\87\EC\E9\80vbp\A6\07<\0D\9Al\01\0B\D8\0F\F7\9F\CE\8E\D7\94\AF\06\C3)\86\93w9\8D\17\BF\9C\BF;(\CD\AB\B3\FA\CC\8A\C5dF\93\0B\F9\F2\8Ev[=\A7\975(\84\19nq\99\91\9A\F0\BAz\B4D\F1z\0A\AE\91\EAx<\8B\95\D8)\FF\BE\B8\83\16gN\0E\0E\D0\A8h\96='m[\FC-\DC\E2\A6\15:\98\A4c\F6&\F5<\CD\0A-\18pc\C0\B5c\0B\80N'\EAd\0C\9B\89\8A\BD\9E\E5~\C3\F9\85\BCN|\CEs\CDf\96\8B\A1\09\F6\E9\13\AEd\F1\88\B5\00L\F3\00-\EA\8A\92cJ\BBrB\F9a\D5\EBW3{\8B\A0|Y8*\10w\FF\EB~\1B=>\82'-\E6\BD\BF\C2R\A7.\B7\22\C4\09\E3\EA\15\95\D14\D1e\90\CBTG\C66Wa\0B\82a\96sE}-l\DE-\B4\CB\01\9E\22 r\1C;Q\10\C88f\14\87\A6\A1\9B=\8E\D1a:\D5\E7\CE\F4\E6\C96\F6\8Df]\18&\098\F0\F6\F2\FA\88\D8\22NP\1Bv\E0V\AA\F7!\B4mpKH\EF?\A3\AAAp\FDZ\1D\07\859M\9C\BB:M-\BFY//\CE\CB\BE\E6\0Cv\E6\F6\83\A3S9k\F1W\D1\AB\8C\10\81\9F\9F\C98\1C\06\A0\EE\B0Hi\B3.\C4\D2\05h)\C7a>+\17\1C\D7sWr.\D6\06\DF\D0\C9\F2\AD\E3\14\D9\CEj\C6R\EB\C6h\ED\BC\7Fu\99\9AD\08FQ0\D7\CB;N`\08\89_aO\E3\DA\8C\FF43{r\BE`\E1\18t\98\02\E3\88]d\E6A\BC\C68\12\D3Q\1E\E8\93\0Dh\C3\C7\96\1B\88U\0EP\14\C2U[\94\FBw.\13Qf\FFT\C5\E8)\E1\85\D2Oc\B6v\C74tY42\16)t\D6\B6\ED\BD\84\EF~\02$", align 1

; Function Attrs: nounwind
define void @hash2(i8* %k, i32 %len, i32* %state) #0 {
entry:
  %k.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %state.addr = alloca i32*, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %h = alloca i32, align 4
  %length = alloca i32, align 4
  store i8* %k, i8** %k.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32* %state, i32** %state.addr, align 4
  %0 = load i32, i32* %len.addr, align 4
  store i32 %0, i32* %length, align 4
  %1 = load i32*, i32** %state.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %1, i32 0
  %2 = load i32, i32* %arrayidx, align 4
  store i32 %2, i32* %a, align 4
  %3 = load i32*, i32** %state.addr, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i32 1
  %4 = load i32, i32* %arrayidx1, align 4
  store i32 %4, i32* %b, align 4
  %5 = load i32*, i32** %state.addr, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i32 2
  %6 = load i32, i32* %arrayidx2, align 4
  store i32 %6, i32* %c, align 4
  %7 = load i32*, i32** %state.addr, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i32 3
  %8 = load i32, i32* %arrayidx3, align 4
  store i32 %8, i32* %d, align 4
  %9 = load i32*, i32** %state.addr, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i32 4
  %10 = load i32, i32* %arrayidx4, align 4
  store i32 %10, i32* %e, align 4
  %11 = load i32*, i32** %state.addr, align 4
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i32 5
  %12 = load i32, i32* %arrayidx5, align 4
  store i32 %12, i32* %f, align 4
  %13 = load i32*, i32** %state.addr, align 4
  %arrayidx6 = getelementptr inbounds i32, i32* %13, i32 6
  %14 = load i32, i32* %arrayidx6, align 4
  store i32 %14, i32* %g, align 4
  %15 = load i32*, i32** %state.addr, align 4
  %arrayidx7 = getelementptr inbounds i32, i32* %15, i32 7
  %16 = load i32, i32* %arrayidx7, align 4
  store i32 %16, i32* %h, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %17 = load i32, i32* %len.addr, align 4
  %cmp = icmp uge i32 %17, 32
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %18 = load i8*, i8** %k.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %18, i32 0
  %19 = bitcast i8* %add.ptr to i32*
  %20 = load i32, i32* %19, align 4
  %21 = load i32, i32* %a, align 4
  %add = add i32 %21, %20
  store i32 %add, i32* %a, align 4
  %22 = load i8*, i8** %k.addr, align 4
  %add.ptr8 = getelementptr inbounds i8, i8* %22, i32 4
  %23 = bitcast i8* %add.ptr8 to i32*
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* %b, align 4
  %add9 = add i32 %25, %24
  store i32 %add9, i32* %b, align 4
  %26 = load i8*, i8** %k.addr, align 4
  %add.ptr10 = getelementptr inbounds i8, i8* %26, i32 8
  %27 = bitcast i8* %add.ptr10 to i32*
  %28 = load i32, i32* %27, align 4
  %29 = load i32, i32* %c, align 4
  %add11 = add i32 %29, %28
  store i32 %add11, i32* %c, align 4
  %30 = load i8*, i8** %k.addr, align 4
  %add.ptr12 = getelementptr inbounds i8, i8* %30, i32 12
  %31 = bitcast i8* %add.ptr12 to i32*
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* %d, align 4
  %add13 = add i32 %33, %32
  store i32 %add13, i32* %d, align 4
  %34 = load i8*, i8** %k.addr, align 4
  %add.ptr14 = getelementptr inbounds i8, i8* %34, i32 16
  %35 = bitcast i8* %add.ptr14 to i32*
  %36 = load i32, i32* %35, align 4
  %37 = load i32, i32* %e, align 4
  %add15 = add i32 %37, %36
  store i32 %add15, i32* %e, align 4
  %38 = load i8*, i8** %k.addr, align 4
  %add.ptr16 = getelementptr inbounds i8, i8* %38, i32 20
  %39 = bitcast i8* %add.ptr16 to i32*
  %40 = load i32, i32* %39, align 4
  %41 = load i32, i32* %f, align 4
  %add17 = add i32 %41, %40
  store i32 %add17, i32* %f, align 4
  %42 = load i8*, i8** %k.addr, align 4
  %add.ptr18 = getelementptr inbounds i8, i8* %42, i32 24
  %43 = bitcast i8* %add.ptr18 to i32*
  %44 = load i32, i32* %43, align 4
  %45 = load i32, i32* %g, align 4
  %add19 = add i32 %45, %44
  store i32 %add19, i32* %g, align 4
  %46 = load i8*, i8** %k.addr, align 4
  %add.ptr20 = getelementptr inbounds i8, i8* %46, i32 28
  %47 = bitcast i8* %add.ptr20 to i32*
  %48 = load i32, i32* %47, align 4
  %49 = load i32, i32* %h, align 4
  %add21 = add i32 %49, %48
  store i32 %add21, i32* %h, align 4
  %50 = load i32, i32* %b, align 4
  %shl = shl i32 %50, 11
  %51 = load i32, i32* %a, align 4
  %xor = xor i32 %51, %shl
  store i32 %xor, i32* %a, align 4
  %52 = load i32, i32* %a, align 4
  %53 = load i32, i32* %d, align 4
  %add22 = add i32 %53, %52
  store i32 %add22, i32* %d, align 4
  %54 = load i32, i32* %c, align 4
  %55 = load i32, i32* %b, align 4
  %add23 = add i32 %55, %54
  store i32 %add23, i32* %b, align 4
  %56 = load i32, i32* %c, align 4
  %shr = lshr i32 %56, 2
  %57 = load i32, i32* %b, align 4
  %xor24 = xor i32 %57, %shr
  store i32 %xor24, i32* %b, align 4
  %58 = load i32, i32* %b, align 4
  %59 = load i32, i32* %e, align 4
  %add25 = add i32 %59, %58
  store i32 %add25, i32* %e, align 4
  %60 = load i32, i32* %d, align 4
  %61 = load i32, i32* %c, align 4
  %add26 = add i32 %61, %60
  store i32 %add26, i32* %c, align 4
  %62 = load i32, i32* %d, align 4
  %shl27 = shl i32 %62, 8
  %63 = load i32, i32* %c, align 4
  %xor28 = xor i32 %63, %shl27
  store i32 %xor28, i32* %c, align 4
  %64 = load i32, i32* %c, align 4
  %65 = load i32, i32* %f, align 4
  %add29 = add i32 %65, %64
  store i32 %add29, i32* %f, align 4
  %66 = load i32, i32* %e, align 4
  %67 = load i32, i32* %d, align 4
  %add30 = add i32 %67, %66
  store i32 %add30, i32* %d, align 4
  %68 = load i32, i32* %e, align 4
  %shr31 = lshr i32 %68, 16
  %69 = load i32, i32* %d, align 4
  %xor32 = xor i32 %69, %shr31
  store i32 %xor32, i32* %d, align 4
  %70 = load i32, i32* %d, align 4
  %71 = load i32, i32* %g, align 4
  %add33 = add i32 %71, %70
  store i32 %add33, i32* %g, align 4
  %72 = load i32, i32* %f, align 4
  %73 = load i32, i32* %e, align 4
  %add34 = add i32 %73, %72
  store i32 %add34, i32* %e, align 4
  %74 = load i32, i32* %f, align 4
  %shl35 = shl i32 %74, 10
  %75 = load i32, i32* %e, align 4
  %xor36 = xor i32 %75, %shl35
  store i32 %xor36, i32* %e, align 4
  %76 = load i32, i32* %e, align 4
  %77 = load i32, i32* %h, align 4
  %add37 = add i32 %77, %76
  store i32 %add37, i32* %h, align 4
  %78 = load i32, i32* %g, align 4
  %79 = load i32, i32* %f, align 4
  %add38 = add i32 %79, %78
  store i32 %add38, i32* %f, align 4
  %80 = load i32, i32* %g, align 4
  %shr39 = lshr i32 %80, 4
  %81 = load i32, i32* %f, align 4
  %xor40 = xor i32 %81, %shr39
  store i32 %xor40, i32* %f, align 4
  %82 = load i32, i32* %f, align 4
  %83 = load i32, i32* %a, align 4
  %add41 = add i32 %83, %82
  store i32 %add41, i32* %a, align 4
  %84 = load i32, i32* %h, align 4
  %85 = load i32, i32* %g, align 4
  %add42 = add i32 %85, %84
  store i32 %add42, i32* %g, align 4
  %86 = load i32, i32* %h, align 4
  %shl43 = shl i32 %86, 8
  %87 = load i32, i32* %g, align 4
  %xor44 = xor i32 %87, %shl43
  store i32 %xor44, i32* %g, align 4
  %88 = load i32, i32* %g, align 4
  %89 = load i32, i32* %b, align 4
  %add45 = add i32 %89, %88
  store i32 %add45, i32* %b, align 4
  %90 = load i32, i32* %a, align 4
  %91 = load i32, i32* %h, align 4
  %add46 = add i32 %91, %90
  store i32 %add46, i32* %h, align 4
  %92 = load i32, i32* %a, align 4
  %shr47 = lshr i32 %92, 9
  %93 = load i32, i32* %h, align 4
  %xor48 = xor i32 %93, %shr47
  store i32 %xor48, i32* %h, align 4
  %94 = load i32, i32* %h, align 4
  %95 = load i32, i32* %c, align 4
  %add49 = add i32 %95, %94
  store i32 %add49, i32* %c, align 4
  %96 = load i32, i32* %b, align 4
  %97 = load i32, i32* %a, align 4
  %add50 = add i32 %97, %96
  store i32 %add50, i32* %a, align 4
  %98 = load i32, i32* %b, align 4
  %shl51 = shl i32 %98, 11
  %99 = load i32, i32* %a, align 4
  %xor52 = xor i32 %99, %shl51
  store i32 %xor52, i32* %a, align 4
  %100 = load i32, i32* %a, align 4
  %101 = load i32, i32* %d, align 4
  %add53 = add i32 %101, %100
  store i32 %add53, i32* %d, align 4
  %102 = load i32, i32* %c, align 4
  %103 = load i32, i32* %b, align 4
  %add54 = add i32 %103, %102
  store i32 %add54, i32* %b, align 4
  %104 = load i32, i32* %c, align 4
  %shr55 = lshr i32 %104, 2
  %105 = load i32, i32* %b, align 4
  %xor56 = xor i32 %105, %shr55
  store i32 %xor56, i32* %b, align 4
  %106 = load i32, i32* %b, align 4
  %107 = load i32, i32* %e, align 4
  %add57 = add i32 %107, %106
  store i32 %add57, i32* %e, align 4
  %108 = load i32, i32* %d, align 4
  %109 = load i32, i32* %c, align 4
  %add58 = add i32 %109, %108
  store i32 %add58, i32* %c, align 4
  %110 = load i32, i32* %d, align 4
  %shl59 = shl i32 %110, 8
  %111 = load i32, i32* %c, align 4
  %xor60 = xor i32 %111, %shl59
  store i32 %xor60, i32* %c, align 4
  %112 = load i32, i32* %c, align 4
  %113 = load i32, i32* %f, align 4
  %add61 = add i32 %113, %112
  store i32 %add61, i32* %f, align 4
  %114 = load i32, i32* %e, align 4
  %115 = load i32, i32* %d, align 4
  %add62 = add i32 %115, %114
  store i32 %add62, i32* %d, align 4
  %116 = load i32, i32* %e, align 4
  %shr63 = lshr i32 %116, 16
  %117 = load i32, i32* %d, align 4
  %xor64 = xor i32 %117, %shr63
  store i32 %xor64, i32* %d, align 4
  %118 = load i32, i32* %d, align 4
  %119 = load i32, i32* %g, align 4
  %add65 = add i32 %119, %118
  store i32 %add65, i32* %g, align 4
  %120 = load i32, i32* %f, align 4
  %121 = load i32, i32* %e, align 4
  %add66 = add i32 %121, %120
  store i32 %add66, i32* %e, align 4
  %122 = load i32, i32* %f, align 4
  %shl67 = shl i32 %122, 10
  %123 = load i32, i32* %e, align 4
  %xor68 = xor i32 %123, %shl67
  store i32 %xor68, i32* %e, align 4
  %124 = load i32, i32* %e, align 4
  %125 = load i32, i32* %h, align 4
  %add69 = add i32 %125, %124
  store i32 %add69, i32* %h, align 4
  %126 = load i32, i32* %g, align 4
  %127 = load i32, i32* %f, align 4
  %add70 = add i32 %127, %126
  store i32 %add70, i32* %f, align 4
  %128 = load i32, i32* %g, align 4
  %shr71 = lshr i32 %128, 4
  %129 = load i32, i32* %f, align 4
  %xor72 = xor i32 %129, %shr71
  store i32 %xor72, i32* %f, align 4
  %130 = load i32, i32* %f, align 4
  %131 = load i32, i32* %a, align 4
  %add73 = add i32 %131, %130
  store i32 %add73, i32* %a, align 4
  %132 = load i32, i32* %h, align 4
  %133 = load i32, i32* %g, align 4
  %add74 = add i32 %133, %132
  store i32 %add74, i32* %g, align 4
  %134 = load i32, i32* %h, align 4
  %shl75 = shl i32 %134, 8
  %135 = load i32, i32* %g, align 4
  %xor76 = xor i32 %135, %shl75
  store i32 %xor76, i32* %g, align 4
  %136 = load i32, i32* %g, align 4
  %137 = load i32, i32* %b, align 4
  %add77 = add i32 %137, %136
  store i32 %add77, i32* %b, align 4
  %138 = load i32, i32* %a, align 4
  %139 = load i32, i32* %h, align 4
  %add78 = add i32 %139, %138
  store i32 %add78, i32* %h, align 4
  %140 = load i32, i32* %a, align 4
  %shr79 = lshr i32 %140, 9
  %141 = load i32, i32* %h, align 4
  %xor80 = xor i32 %141, %shr79
  store i32 %xor80, i32* %h, align 4
  %142 = load i32, i32* %h, align 4
  %143 = load i32, i32* %c, align 4
  %add81 = add i32 %143, %142
  store i32 %add81, i32* %c, align 4
  %144 = load i32, i32* %b, align 4
  %145 = load i32, i32* %a, align 4
  %add82 = add i32 %145, %144
  store i32 %add82, i32* %a, align 4
  %146 = load i32, i32* %b, align 4
  %shl83 = shl i32 %146, 11
  %147 = load i32, i32* %a, align 4
  %xor84 = xor i32 %147, %shl83
  store i32 %xor84, i32* %a, align 4
  %148 = load i32, i32* %a, align 4
  %149 = load i32, i32* %d, align 4
  %add85 = add i32 %149, %148
  store i32 %add85, i32* %d, align 4
  %150 = load i32, i32* %c, align 4
  %151 = load i32, i32* %b, align 4
  %add86 = add i32 %151, %150
  store i32 %add86, i32* %b, align 4
  %152 = load i32, i32* %c, align 4
  %shr87 = lshr i32 %152, 2
  %153 = load i32, i32* %b, align 4
  %xor88 = xor i32 %153, %shr87
  store i32 %xor88, i32* %b, align 4
  %154 = load i32, i32* %b, align 4
  %155 = load i32, i32* %e, align 4
  %add89 = add i32 %155, %154
  store i32 %add89, i32* %e, align 4
  %156 = load i32, i32* %d, align 4
  %157 = load i32, i32* %c, align 4
  %add90 = add i32 %157, %156
  store i32 %add90, i32* %c, align 4
  %158 = load i32, i32* %d, align 4
  %shl91 = shl i32 %158, 8
  %159 = load i32, i32* %c, align 4
  %xor92 = xor i32 %159, %shl91
  store i32 %xor92, i32* %c, align 4
  %160 = load i32, i32* %c, align 4
  %161 = load i32, i32* %f, align 4
  %add93 = add i32 %161, %160
  store i32 %add93, i32* %f, align 4
  %162 = load i32, i32* %e, align 4
  %163 = load i32, i32* %d, align 4
  %add94 = add i32 %163, %162
  store i32 %add94, i32* %d, align 4
  %164 = load i32, i32* %e, align 4
  %shr95 = lshr i32 %164, 16
  %165 = load i32, i32* %d, align 4
  %xor96 = xor i32 %165, %shr95
  store i32 %xor96, i32* %d, align 4
  %166 = load i32, i32* %d, align 4
  %167 = load i32, i32* %g, align 4
  %add97 = add i32 %167, %166
  store i32 %add97, i32* %g, align 4
  %168 = load i32, i32* %f, align 4
  %169 = load i32, i32* %e, align 4
  %add98 = add i32 %169, %168
  store i32 %add98, i32* %e, align 4
  %170 = load i32, i32* %f, align 4
  %shl99 = shl i32 %170, 10
  %171 = load i32, i32* %e, align 4
  %xor100 = xor i32 %171, %shl99
  store i32 %xor100, i32* %e, align 4
  %172 = load i32, i32* %e, align 4
  %173 = load i32, i32* %h, align 4
  %add101 = add i32 %173, %172
  store i32 %add101, i32* %h, align 4
  %174 = load i32, i32* %g, align 4
  %175 = load i32, i32* %f, align 4
  %add102 = add i32 %175, %174
  store i32 %add102, i32* %f, align 4
  %176 = load i32, i32* %g, align 4
  %shr103 = lshr i32 %176, 4
  %177 = load i32, i32* %f, align 4
  %xor104 = xor i32 %177, %shr103
  store i32 %xor104, i32* %f, align 4
  %178 = load i32, i32* %f, align 4
  %179 = load i32, i32* %a, align 4
  %add105 = add i32 %179, %178
  store i32 %add105, i32* %a, align 4
  %180 = load i32, i32* %h, align 4
  %181 = load i32, i32* %g, align 4
  %add106 = add i32 %181, %180
  store i32 %add106, i32* %g, align 4
  %182 = load i32, i32* %h, align 4
  %shl107 = shl i32 %182, 8
  %183 = load i32, i32* %g, align 4
  %xor108 = xor i32 %183, %shl107
  store i32 %xor108, i32* %g, align 4
  %184 = load i32, i32* %g, align 4
  %185 = load i32, i32* %b, align 4
  %add109 = add i32 %185, %184
  store i32 %add109, i32* %b, align 4
  %186 = load i32, i32* %a, align 4
  %187 = load i32, i32* %h, align 4
  %add110 = add i32 %187, %186
  store i32 %add110, i32* %h, align 4
  %188 = load i32, i32* %a, align 4
  %shr111 = lshr i32 %188, 9
  %189 = load i32, i32* %h, align 4
  %xor112 = xor i32 %189, %shr111
  store i32 %xor112, i32* %h, align 4
  %190 = load i32, i32* %h, align 4
  %191 = load i32, i32* %c, align 4
  %add113 = add i32 %191, %190
  store i32 %add113, i32* %c, align 4
  %192 = load i32, i32* %b, align 4
  %193 = load i32, i32* %a, align 4
  %add114 = add i32 %193, %192
  store i32 %add114, i32* %a, align 4
  %194 = load i32, i32* %b, align 4
  %shl115 = shl i32 %194, 11
  %195 = load i32, i32* %a, align 4
  %xor116 = xor i32 %195, %shl115
  store i32 %xor116, i32* %a, align 4
  %196 = load i32, i32* %a, align 4
  %197 = load i32, i32* %d, align 4
  %add117 = add i32 %197, %196
  store i32 %add117, i32* %d, align 4
  %198 = load i32, i32* %c, align 4
  %199 = load i32, i32* %b, align 4
  %add118 = add i32 %199, %198
  store i32 %add118, i32* %b, align 4
  %200 = load i32, i32* %c, align 4
  %shr119 = lshr i32 %200, 2
  %201 = load i32, i32* %b, align 4
  %xor120 = xor i32 %201, %shr119
  store i32 %xor120, i32* %b, align 4
  %202 = load i32, i32* %b, align 4
  %203 = load i32, i32* %e, align 4
  %add121 = add i32 %203, %202
  store i32 %add121, i32* %e, align 4
  %204 = load i32, i32* %d, align 4
  %205 = load i32, i32* %c, align 4
  %add122 = add i32 %205, %204
  store i32 %add122, i32* %c, align 4
  %206 = load i32, i32* %d, align 4
  %shl123 = shl i32 %206, 8
  %207 = load i32, i32* %c, align 4
  %xor124 = xor i32 %207, %shl123
  store i32 %xor124, i32* %c, align 4
  %208 = load i32, i32* %c, align 4
  %209 = load i32, i32* %f, align 4
  %add125 = add i32 %209, %208
  store i32 %add125, i32* %f, align 4
  %210 = load i32, i32* %e, align 4
  %211 = load i32, i32* %d, align 4
  %add126 = add i32 %211, %210
  store i32 %add126, i32* %d, align 4
  %212 = load i32, i32* %e, align 4
  %shr127 = lshr i32 %212, 16
  %213 = load i32, i32* %d, align 4
  %xor128 = xor i32 %213, %shr127
  store i32 %xor128, i32* %d, align 4
  %214 = load i32, i32* %d, align 4
  %215 = load i32, i32* %g, align 4
  %add129 = add i32 %215, %214
  store i32 %add129, i32* %g, align 4
  %216 = load i32, i32* %f, align 4
  %217 = load i32, i32* %e, align 4
  %add130 = add i32 %217, %216
  store i32 %add130, i32* %e, align 4
  %218 = load i32, i32* %f, align 4
  %shl131 = shl i32 %218, 10
  %219 = load i32, i32* %e, align 4
  %xor132 = xor i32 %219, %shl131
  store i32 %xor132, i32* %e, align 4
  %220 = load i32, i32* %e, align 4
  %221 = load i32, i32* %h, align 4
  %add133 = add i32 %221, %220
  store i32 %add133, i32* %h, align 4
  %222 = load i32, i32* %g, align 4
  %223 = load i32, i32* %f, align 4
  %add134 = add i32 %223, %222
  store i32 %add134, i32* %f, align 4
  %224 = load i32, i32* %g, align 4
  %shr135 = lshr i32 %224, 4
  %225 = load i32, i32* %f, align 4
  %xor136 = xor i32 %225, %shr135
  store i32 %xor136, i32* %f, align 4
  %226 = load i32, i32* %f, align 4
  %227 = load i32, i32* %a, align 4
  %add137 = add i32 %227, %226
  store i32 %add137, i32* %a, align 4
  %228 = load i32, i32* %h, align 4
  %229 = load i32, i32* %g, align 4
  %add138 = add i32 %229, %228
  store i32 %add138, i32* %g, align 4
  %230 = load i32, i32* %h, align 4
  %shl139 = shl i32 %230, 8
  %231 = load i32, i32* %g, align 4
  %xor140 = xor i32 %231, %shl139
  store i32 %xor140, i32* %g, align 4
  %232 = load i32, i32* %g, align 4
  %233 = load i32, i32* %b, align 4
  %add141 = add i32 %233, %232
  store i32 %add141, i32* %b, align 4
  %234 = load i32, i32* %a, align 4
  %235 = load i32, i32* %h, align 4
  %add142 = add i32 %235, %234
  store i32 %add142, i32* %h, align 4
  %236 = load i32, i32* %a, align 4
  %shr143 = lshr i32 %236, 9
  %237 = load i32, i32* %h, align 4
  %xor144 = xor i32 %237, %shr143
  store i32 %xor144, i32* %h, align 4
  %238 = load i32, i32* %h, align 4
  %239 = load i32, i32* %c, align 4
  %add145 = add i32 %239, %238
  store i32 %add145, i32* %c, align 4
  %240 = load i32, i32* %b, align 4
  %241 = load i32, i32* %a, align 4
  %add146 = add i32 %241, %240
  store i32 %add146, i32* %a, align 4
  %242 = load i8*, i8** %k.addr, align 4
  %add.ptr147 = getelementptr inbounds i8, i8* %242, i32 32
  store i8* %add.ptr147, i8** %k.addr, align 4
  %243 = load i32, i32* %len.addr, align 4
  %sub = sub i32 %243, 32
  store i32 %sub, i32* %len.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %244 = load i32, i32* %len.addr, align 4
  switch i32 %244, label %sw.epilog [
    i32 31, label %sw.bb
    i32 30, label %sw.bb151
    i32 29, label %sw.bb156
    i32 28, label %sw.bb161
    i32 27, label %sw.bb166
    i32 26, label %sw.bb171
    i32 25, label %sw.bb176
    i32 24, label %sw.bb180
    i32 23, label %sw.bb185
    i32 22, label %sw.bb190
    i32 21, label %sw.bb195
    i32 20, label %sw.bb199
    i32 19, label %sw.bb204
    i32 18, label %sw.bb209
    i32 17, label %sw.bb214
    i32 16, label %sw.bb218
    i32 15, label %sw.bb223
    i32 14, label %sw.bb228
    i32 13, label %sw.bb233
    i32 12, label %sw.bb237
    i32 11, label %sw.bb242
    i32 10, label %sw.bb247
    i32 9, label %sw.bb252
    i32 8, label %sw.bb256
    i32 7, label %sw.bb261
    i32 6, label %sw.bb266
    i32 5, label %sw.bb271
    i32 4, label %sw.bb275
    i32 3, label %sw.bb280
    i32 2, label %sw.bb285
    i32 1, label %sw.bb290
  ]

sw.bb:                                            ; preds = %while.end
  %245 = load i8*, i8** %k.addr, align 4
  %arrayidx148 = getelementptr inbounds i8, i8* %245, i32 30
  %246 = load i8, i8* %arrayidx148, align 1
  %conv = zext i8 %246 to i32
  %shl149 = shl i32 %conv, 24
  %247 = load i32, i32* %h, align 4
  %add150 = add i32 %247, %shl149
  store i32 %add150, i32* %h, align 4
  br label %sw.bb151

sw.bb151:                                         ; preds = %while.end, %sw.bb
  %248 = load i8*, i8** %k.addr, align 4
  %arrayidx152 = getelementptr inbounds i8, i8* %248, i32 29
  %249 = load i8, i8* %arrayidx152, align 1
  %conv153 = zext i8 %249 to i32
  %shl154 = shl i32 %conv153, 16
  %250 = load i32, i32* %h, align 4
  %add155 = add i32 %250, %shl154
  store i32 %add155, i32* %h, align 4
  br label %sw.bb156

sw.bb156:                                         ; preds = %while.end, %sw.bb151
  %251 = load i8*, i8** %k.addr, align 4
  %arrayidx157 = getelementptr inbounds i8, i8* %251, i32 28
  %252 = load i8, i8* %arrayidx157, align 1
  %conv158 = zext i8 %252 to i32
  %shl159 = shl i32 %conv158, 8
  %253 = load i32, i32* %h, align 4
  %add160 = add i32 %253, %shl159
  store i32 %add160, i32* %h, align 4
  br label %sw.bb161

sw.bb161:                                         ; preds = %while.end, %sw.bb156
  %254 = load i8*, i8** %k.addr, align 4
  %arrayidx162 = getelementptr inbounds i8, i8* %254, i32 27
  %255 = load i8, i8* %arrayidx162, align 1
  %conv163 = zext i8 %255 to i32
  %shl164 = shl i32 %conv163, 24
  %256 = load i32, i32* %g, align 4
  %add165 = add i32 %256, %shl164
  store i32 %add165, i32* %g, align 4
  br label %sw.bb166

sw.bb166:                                         ; preds = %while.end, %sw.bb161
  %257 = load i8*, i8** %k.addr, align 4
  %arrayidx167 = getelementptr inbounds i8, i8* %257, i32 26
  %258 = load i8, i8* %arrayidx167, align 1
  %conv168 = zext i8 %258 to i32
  %shl169 = shl i32 %conv168, 16
  %259 = load i32, i32* %g, align 4
  %add170 = add i32 %259, %shl169
  store i32 %add170, i32* %g, align 4
  br label %sw.bb171

sw.bb171:                                         ; preds = %while.end, %sw.bb166
  %260 = load i8*, i8** %k.addr, align 4
  %arrayidx172 = getelementptr inbounds i8, i8* %260, i32 25
  %261 = load i8, i8* %arrayidx172, align 1
  %conv173 = zext i8 %261 to i32
  %shl174 = shl i32 %conv173, 8
  %262 = load i32, i32* %g, align 4
  %add175 = add i32 %262, %shl174
  store i32 %add175, i32* %g, align 4
  br label %sw.bb176

sw.bb176:                                         ; preds = %while.end, %sw.bb171
  %263 = load i8*, i8** %k.addr, align 4
  %arrayidx177 = getelementptr inbounds i8, i8* %263, i32 24
  %264 = load i8, i8* %arrayidx177, align 1
  %conv178 = zext i8 %264 to i32
  %265 = load i32, i32* %g, align 4
  %add179 = add i32 %265, %conv178
  store i32 %add179, i32* %g, align 4
  br label %sw.bb180

sw.bb180:                                         ; preds = %while.end, %sw.bb176
  %266 = load i8*, i8** %k.addr, align 4
  %arrayidx181 = getelementptr inbounds i8, i8* %266, i32 23
  %267 = load i8, i8* %arrayidx181, align 1
  %conv182 = zext i8 %267 to i32
  %shl183 = shl i32 %conv182, 24
  %268 = load i32, i32* %f, align 4
  %add184 = add i32 %268, %shl183
  store i32 %add184, i32* %f, align 4
  br label %sw.bb185

sw.bb185:                                         ; preds = %while.end, %sw.bb180
  %269 = load i8*, i8** %k.addr, align 4
  %arrayidx186 = getelementptr inbounds i8, i8* %269, i32 22
  %270 = load i8, i8* %arrayidx186, align 1
  %conv187 = zext i8 %270 to i32
  %shl188 = shl i32 %conv187, 16
  %271 = load i32, i32* %f, align 4
  %add189 = add i32 %271, %shl188
  store i32 %add189, i32* %f, align 4
  br label %sw.bb190

sw.bb190:                                         ; preds = %while.end, %sw.bb185
  %272 = load i8*, i8** %k.addr, align 4
  %arrayidx191 = getelementptr inbounds i8, i8* %272, i32 21
  %273 = load i8, i8* %arrayidx191, align 1
  %conv192 = zext i8 %273 to i32
  %shl193 = shl i32 %conv192, 8
  %274 = load i32, i32* %f, align 4
  %add194 = add i32 %274, %shl193
  store i32 %add194, i32* %f, align 4
  br label %sw.bb195

sw.bb195:                                         ; preds = %while.end, %sw.bb190
  %275 = load i8*, i8** %k.addr, align 4
  %arrayidx196 = getelementptr inbounds i8, i8* %275, i32 20
  %276 = load i8, i8* %arrayidx196, align 1
  %conv197 = zext i8 %276 to i32
  %277 = load i32, i32* %f, align 4
  %add198 = add i32 %277, %conv197
  store i32 %add198, i32* %f, align 4
  br label %sw.bb199

sw.bb199:                                         ; preds = %while.end, %sw.bb195
  %278 = load i8*, i8** %k.addr, align 4
  %arrayidx200 = getelementptr inbounds i8, i8* %278, i32 19
  %279 = load i8, i8* %arrayidx200, align 1
  %conv201 = zext i8 %279 to i32
  %shl202 = shl i32 %conv201, 24
  %280 = load i32, i32* %e, align 4
  %add203 = add i32 %280, %shl202
  store i32 %add203, i32* %e, align 4
  br label %sw.bb204

sw.bb204:                                         ; preds = %while.end, %sw.bb199
  %281 = load i8*, i8** %k.addr, align 4
  %arrayidx205 = getelementptr inbounds i8, i8* %281, i32 18
  %282 = load i8, i8* %arrayidx205, align 1
  %conv206 = zext i8 %282 to i32
  %shl207 = shl i32 %conv206, 16
  %283 = load i32, i32* %e, align 4
  %add208 = add i32 %283, %shl207
  store i32 %add208, i32* %e, align 4
  br label %sw.bb209

sw.bb209:                                         ; preds = %while.end, %sw.bb204
  %284 = load i8*, i8** %k.addr, align 4
  %arrayidx210 = getelementptr inbounds i8, i8* %284, i32 17
  %285 = load i8, i8* %arrayidx210, align 1
  %conv211 = zext i8 %285 to i32
  %shl212 = shl i32 %conv211, 8
  %286 = load i32, i32* %e, align 4
  %add213 = add i32 %286, %shl212
  store i32 %add213, i32* %e, align 4
  br label %sw.bb214

sw.bb214:                                         ; preds = %while.end, %sw.bb209
  %287 = load i8*, i8** %k.addr, align 4
  %arrayidx215 = getelementptr inbounds i8, i8* %287, i32 16
  %288 = load i8, i8* %arrayidx215, align 1
  %conv216 = zext i8 %288 to i32
  %289 = load i32, i32* %e, align 4
  %add217 = add i32 %289, %conv216
  store i32 %add217, i32* %e, align 4
  br label %sw.bb218

sw.bb218:                                         ; preds = %while.end, %sw.bb214
  %290 = load i8*, i8** %k.addr, align 4
  %arrayidx219 = getelementptr inbounds i8, i8* %290, i32 15
  %291 = load i8, i8* %arrayidx219, align 1
  %conv220 = zext i8 %291 to i32
  %shl221 = shl i32 %conv220, 24
  %292 = load i32, i32* %d, align 4
  %add222 = add i32 %292, %shl221
  store i32 %add222, i32* %d, align 4
  br label %sw.bb223

sw.bb223:                                         ; preds = %while.end, %sw.bb218
  %293 = load i8*, i8** %k.addr, align 4
  %arrayidx224 = getelementptr inbounds i8, i8* %293, i32 14
  %294 = load i8, i8* %arrayidx224, align 1
  %conv225 = zext i8 %294 to i32
  %shl226 = shl i32 %conv225, 16
  %295 = load i32, i32* %d, align 4
  %add227 = add i32 %295, %shl226
  store i32 %add227, i32* %d, align 4
  br label %sw.bb228

sw.bb228:                                         ; preds = %while.end, %sw.bb223
  %296 = load i8*, i8** %k.addr, align 4
  %arrayidx229 = getelementptr inbounds i8, i8* %296, i32 13
  %297 = load i8, i8* %arrayidx229, align 1
  %conv230 = zext i8 %297 to i32
  %shl231 = shl i32 %conv230, 8
  %298 = load i32, i32* %d, align 4
  %add232 = add i32 %298, %shl231
  store i32 %add232, i32* %d, align 4
  br label %sw.bb233

sw.bb233:                                         ; preds = %while.end, %sw.bb228
  %299 = load i8*, i8** %k.addr, align 4
  %arrayidx234 = getelementptr inbounds i8, i8* %299, i32 12
  %300 = load i8, i8* %arrayidx234, align 1
  %conv235 = zext i8 %300 to i32
  %301 = load i32, i32* %d, align 4
  %add236 = add i32 %301, %conv235
  store i32 %add236, i32* %d, align 4
  br label %sw.bb237

sw.bb237:                                         ; preds = %while.end, %sw.bb233
  %302 = load i8*, i8** %k.addr, align 4
  %arrayidx238 = getelementptr inbounds i8, i8* %302, i32 11
  %303 = load i8, i8* %arrayidx238, align 1
  %conv239 = zext i8 %303 to i32
  %shl240 = shl i32 %conv239, 24
  %304 = load i32, i32* %c, align 4
  %add241 = add i32 %304, %shl240
  store i32 %add241, i32* %c, align 4
  br label %sw.bb242

sw.bb242:                                         ; preds = %while.end, %sw.bb237
  %305 = load i8*, i8** %k.addr, align 4
  %arrayidx243 = getelementptr inbounds i8, i8* %305, i32 10
  %306 = load i8, i8* %arrayidx243, align 1
  %conv244 = zext i8 %306 to i32
  %shl245 = shl i32 %conv244, 16
  %307 = load i32, i32* %c, align 4
  %add246 = add i32 %307, %shl245
  store i32 %add246, i32* %c, align 4
  br label %sw.bb247

sw.bb247:                                         ; preds = %while.end, %sw.bb242
  %308 = load i8*, i8** %k.addr, align 4
  %arrayidx248 = getelementptr inbounds i8, i8* %308, i32 9
  %309 = load i8, i8* %arrayidx248, align 1
  %conv249 = zext i8 %309 to i32
  %shl250 = shl i32 %conv249, 8
  %310 = load i32, i32* %c, align 4
  %add251 = add i32 %310, %shl250
  store i32 %add251, i32* %c, align 4
  br label %sw.bb252

sw.bb252:                                         ; preds = %while.end, %sw.bb247
  %311 = load i8*, i8** %k.addr, align 4
  %arrayidx253 = getelementptr inbounds i8, i8* %311, i32 8
  %312 = load i8, i8* %arrayidx253, align 1
  %conv254 = zext i8 %312 to i32
  %313 = load i32, i32* %c, align 4
  %add255 = add i32 %313, %conv254
  store i32 %add255, i32* %c, align 4
  br label %sw.bb256

sw.bb256:                                         ; preds = %while.end, %sw.bb252
  %314 = load i8*, i8** %k.addr, align 4
  %arrayidx257 = getelementptr inbounds i8, i8* %314, i32 7
  %315 = load i8, i8* %arrayidx257, align 1
  %conv258 = zext i8 %315 to i32
  %shl259 = shl i32 %conv258, 24
  %316 = load i32, i32* %b, align 4
  %add260 = add i32 %316, %shl259
  store i32 %add260, i32* %b, align 4
  br label %sw.bb261

sw.bb261:                                         ; preds = %while.end, %sw.bb256
  %317 = load i8*, i8** %k.addr, align 4
  %arrayidx262 = getelementptr inbounds i8, i8* %317, i32 6
  %318 = load i8, i8* %arrayidx262, align 1
  %conv263 = zext i8 %318 to i32
  %shl264 = shl i32 %conv263, 16
  %319 = load i32, i32* %b, align 4
  %add265 = add i32 %319, %shl264
  store i32 %add265, i32* %b, align 4
  br label %sw.bb266

sw.bb266:                                         ; preds = %while.end, %sw.bb261
  %320 = load i8*, i8** %k.addr, align 4
  %arrayidx267 = getelementptr inbounds i8, i8* %320, i32 5
  %321 = load i8, i8* %arrayidx267, align 1
  %conv268 = zext i8 %321 to i32
  %shl269 = shl i32 %conv268, 8
  %322 = load i32, i32* %b, align 4
  %add270 = add i32 %322, %shl269
  store i32 %add270, i32* %b, align 4
  br label %sw.bb271

sw.bb271:                                         ; preds = %while.end, %sw.bb266
  %323 = load i8*, i8** %k.addr, align 4
  %arrayidx272 = getelementptr inbounds i8, i8* %323, i32 4
  %324 = load i8, i8* %arrayidx272, align 1
  %conv273 = zext i8 %324 to i32
  %325 = load i32, i32* %b, align 4
  %add274 = add i32 %325, %conv273
  store i32 %add274, i32* %b, align 4
  br label %sw.bb275

sw.bb275:                                         ; preds = %while.end, %sw.bb271
  %326 = load i8*, i8** %k.addr, align 4
  %arrayidx276 = getelementptr inbounds i8, i8* %326, i32 3
  %327 = load i8, i8* %arrayidx276, align 1
  %conv277 = zext i8 %327 to i32
  %shl278 = shl i32 %conv277, 24
  %328 = load i32, i32* %a, align 4
  %add279 = add i32 %328, %shl278
  store i32 %add279, i32* %a, align 4
  br label %sw.bb280

sw.bb280:                                         ; preds = %while.end, %sw.bb275
  %329 = load i8*, i8** %k.addr, align 4
  %arrayidx281 = getelementptr inbounds i8, i8* %329, i32 2
  %330 = load i8, i8* %arrayidx281, align 1
  %conv282 = zext i8 %330 to i32
  %shl283 = shl i32 %conv282, 16
  %331 = load i32, i32* %a, align 4
  %add284 = add i32 %331, %shl283
  store i32 %add284, i32* %a, align 4
  br label %sw.bb285

sw.bb285:                                         ; preds = %while.end, %sw.bb280
  %332 = load i8*, i8** %k.addr, align 4
  %arrayidx286 = getelementptr inbounds i8, i8* %332, i32 1
  %333 = load i8, i8* %arrayidx286, align 1
  %conv287 = zext i8 %333 to i32
  %shl288 = shl i32 %conv287, 8
  %334 = load i32, i32* %a, align 4
  %add289 = add i32 %334, %shl288
  store i32 %add289, i32* %a, align 4
  br label %sw.bb290

sw.bb290:                                         ; preds = %while.end, %sw.bb285
  %335 = load i8*, i8** %k.addr, align 4
  %arrayidx291 = getelementptr inbounds i8, i8* %335, i32 0
  %336 = load i8, i8* %arrayidx291, align 1
  %conv292 = zext i8 %336 to i32
  %337 = load i32, i32* %a, align 4
  %add293 = add i32 %337, %conv292
  store i32 %add293, i32* %a, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb290, %while.end
  %338 = load i32, i32* %a, align 4
  %339 = load i32*, i32** %state.addr, align 4
  %arrayidx294 = getelementptr inbounds i32, i32* %339, i32 0
  store i32 %338, i32* %arrayidx294, align 4
  %340 = load i32, i32* %b, align 4
  %341 = load i32*, i32** %state.addr, align 4
  %arrayidx295 = getelementptr inbounds i32, i32* %341, i32 1
  store i32 %340, i32* %arrayidx295, align 4
  %342 = load i32, i32* %c, align 4
  %343 = load i32*, i32** %state.addr, align 4
  %arrayidx296 = getelementptr inbounds i32, i32* %343, i32 2
  store i32 %342, i32* %arrayidx296, align 4
  %344 = load i32, i32* %d, align 4
  %345 = load i32*, i32** %state.addr, align 4
  %arrayidx297 = getelementptr inbounds i32, i32* %345, i32 3
  store i32 %344, i32* %arrayidx297, align 4
  %346 = load i32, i32* %e, align 4
  %347 = load i32*, i32** %state.addr, align 4
  %arrayidx298 = getelementptr inbounds i32, i32* %347, i32 4
  store i32 %346, i32* %arrayidx298, align 4
  %348 = load i32, i32* %f, align 4
  %349 = load i32*, i32** %state.addr, align 4
  %arrayidx299 = getelementptr inbounds i32, i32* %349, i32 5
  store i32 %348, i32* %arrayidx299, align 4
  %350 = load i32, i32* %g, align 4
  %351 = load i32*, i32** %state.addr, align 4
  %arrayidx300 = getelementptr inbounds i32, i32* %351, i32 6
  store i32 %350, i32* %arrayidx300, align 4
  %352 = load i32, i32* %h, align 4
  %353 = load i32*, i32** %state.addr, align 4
  %arrayidx301 = getelementptr inbounds i32, i32* %353, i32 7
  store i32 %352, i32* %arrayidx301, align 4
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %estado = alloca [8 x i32], align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [8 x i32], [8 x i32]* %estado, i32 0, i32 %1
  store i32 -1640531527, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [8 x i32], [8 x i32]* %estado, i32 0, i32 0
  call void @hash2(i8* getelementptr inbounds ([4000 x i8], [4000 x i8]* @msg1, i32 0, i32 0), i32 4000, i32* %arraydecay)
  ret i32 0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
