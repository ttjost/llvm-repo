; ModuleID = 'g3fax.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@fax = global [1792 x i8] c"II*\00\93\A1\00\00\00\80\B2Y\01\00\80\B2Y\01\00\80\B2Y\01\00\80\B2Y\01\00\80\A9\9A\7Ft\F3\15gp\C5\1Cr\10>\E8\F2\81opdp\87\1F\A4\E7+C\0E~\90\8348\02\92\D1\9E\EF\F3\1D\DC\C1\E5\F0\83\F4|?\81\827D'\854\B8\83\1Fz\90\8C6xCv\C3\C1\10\BE\9E\01\00\80\A9\F2\B9\BF{>\D8\88\C1\CE\F3}\FE\99\D6\95\B3+\F7\A0/\F3}\BE\FB\AC\FA\DD\F3}\BE\CF\CF+\E6\F7y\9F\EF\F3\F3\88\E5\F3}\BE\CF\F7\93\EAy\BE\AE<\DF_\E6\F7\C4\FC\9E\98\EF\F3\B7\CF\97\CF?\EB\19\00\80\A9\DA\F7}\9F\DF\DF\E0}\F9\E0\FD<\DF\E7\F7>\F5\FE\B2\9F\BD\EC\F7\A0/\F3}\BE\EF\FB\BE\EAy\9F\EF\F3}\C4\8A\97\97\F9>?/\1F1\DF\E7\FB|?\A9\9E\E7\EB\CA\F3\FDe\BE\BF\9C\ED/\F3}\FE\F6\F9\F2\B3{_\CF\00\80\A9\BA\EF}\FE\ED3^\CC8\CF\F7\F9y\D0\89{\C5}C\D0_\E6\FB|\BF\EFU\CF\FB|\9F\EF#V\BC\BC\CC\F7\F9\F9j\F0|\9F\EF\F3\FD\A4z\9E\AF+\CFwHu\BF|\FB\BE\E2\9E\BF}\BE\FC\DB\CF\EB\19\00\80\A9\BA\EF}~>\83\E7\E57x\9E\C3\1B\9E\07\9D\7F\83\BF\97Q\E1\0D\EF\F9~\DF\AB\9Ewx\CFo\08\9F\0C\E9\17p\9F\9F_V\C0{\BE\83\FBI\F5<_W\85\13\13\1F\BC\EF{\87\13g\C8n8\E2\BE\CF\EB\19\00\80\A9\9A\EF\E0y\E0\11+F\BC\9C\07=\9F\CF\CE\E7\AB\91_\EE\F3|\9F\AFz\DE\EF\F3\FC\E5<\EA\FE2\DF\E7\E7\89\C9/\F3}\BE\9FT\CF\F3u\E6\97\F3y\BE\EF\DF>?\9F\E7o\1Fx\FF\CE\EB\19\00\80\A9\9A\EF\F3\F3\C0#V\8Cx9\0Fz\06?g\F0e\E4\97\EF\9B\EF\F3U\CF\FB\F7\CD_\CE\A3\EE/\F3}~\9E\CFx\99\EF\F3\FD\A4z\9E\AF3\BF\9C\CF\F3\DDy\9F\9F\CF\F3\B7\0F\EC|^\CF\00\80\A9\9A\EF\F3\F3\C0\E7\F9\8A\E5/\F3A\97\0F|\9FG}9\DF\F3}\BE\EAw\9F\EF\F9>?\AF\98\DF\E7}\BE\CF\CF\E7\81_\E6\FB|?\A9\9E\E7\EB\D2\F7y~\9E\EF\F3}~>\CF\DF\BE\DCy~^\CF\00\80\A9\9A\EF\F3\F3d\C8A\C0\90C3\9A!\E8\90e\E0\0FE\7F\99\DF\90\9E\AF\0C\B9\F9\0D9\08\9F\0C\C9h\CFo\08?\83\CB\AF =\DF\C1\13\E5\1C\A2\93\A2\19%\E6\90\83\1C\84\CF!\BB\97\9BC\0E\A27\00\80\B2Y\01\00\80\B2Y\01\00\80\B2Y\01\00\80\B2Y\01\00\80\B2Y\01\00\80[\CA\5C8\14\81b\85\83\15g\97\04\E6\8A\9Er*\B0\D0Qa\D3\B0\09\E4\11G\02\1E\10\1C\92A\7F\98\C5\A0\1C\1D4\83g|x\D0\01\FB\A0T8 \8D\07\194\83d\F0\05\22\D0\C3\07\9BA\06\1D\94\80y\05\F3\03\1D\06B\80\9E\91A\07t\FB\01\00\80\A9\C0@\84\06K\9C\B1\90&\B0p\15\96\82\85\8E\0E\8B\86\F9A\06\E2H\C0\03\16\19;\FA0\8BA9\E2H\86\91\D1A\1B?l\06\C5\E0\0A\E3p\C7\874\92\C1\0B*Ga\F4\F0\A1\834z\E8 \02\16\0Bl\06t\18\E6\19\E6\0Fit@\B7\1F\00\80i\01\A1\A8\82\BA\1C\E6H\FC8\07fnRX\E8T@<\18\0F9\C4\91\80\07\10\05\0D\FC0+G8\10\05;\FA\E8\A0\8D\1El\1A=t\90\15,\06\EC\0F\A3\A0r\88@\02\19\F4\D1F\06\1D\94@\1BY\D0F\07A\C0f`sPG\06t\FB\01\00\80\09\86\81\8A\AE\D0\07\1D\EB\85\B0)[\15\16:\0DR\C1| \8342h\03Q\D0@\07u\A8\A3r\94\83.\A8\F1\E3C\1B\1D\B0\0F\1A\D0AW\98=\B0?\E8\19\C5\C03l\06}t\D0\C3\87\09t\D0\05\1D<(\1Dmd\90F\06\EE\E8 v\18\00\80i\1D\07\C1\02Y \05\06\C3+!h\F0\A7\0C\0B\1D\04\A9\10\1C9\A4!\0D\09\A4a\FE\B0\18\D4\A1\8E1(\07]\E0\C0\8F\07i\F4`3hC\DEr\10\1C\E4\C1~8pF\11 \07\9BA\1F\09d\D0A\09|\E8\02\C4\83/\C8 \81\1C\12\A0\18\D4\BE\00\80\A9\02C\02\FA\22\1C\E1 \8Cj\E1\D5\90\81\01\0D\0B\1D\0A\A9\10G\0E6\03\F6F\1C9\D84\1AH\A0r\94\03\91a~h\A3\83\1El\06\1D\04\08\DA\F0\07\FB\E1@\1F+\A0\03\9BA\1Fmd\D0A\09t\10\18\8C\0CcA\0F\0D\E4\D0\01\FB\80\DB3\00\80\09\03:\04\160\08G\81\19\D9\CD\19\02\0D\0B]\09\AD\91@\0E\E6\0F\8BA\02i\B07n\A4\B1\1C\E5\A8\A3\0F\8B\83E#\83\06t\90\C1X\90\86ft\D0Cq$\A3d\A4!8d\D0G\1BidP\02\1Dt\01\E2a,\E8 \81f\B4\C1>0\EC\0F\00\80\89\0E\03\0C\0Ab\5C8\E6\C2C\A6O\8E\CF\84\94a\AE\AB\22+$ \07\06\07\E3\90F\1C2\88#\8D\1B\AD\91\826z\B0iX\1C:hC\0E\16\87\E5\90\81dt\D0\83\F9!\12\B4\D1A\0F?\DA\C8\A0\83\0A\A4\11\18\09d\C0Wt\90@\0Ei\D8\1C\B8=\03\00\80\09\82`\C1\82\80#\E1\07\03\83\83\A4`a\AFi\10\8ETp\8E6,\1Eutp\A35R\90F\02\19\B4a\FE\E8\A0\0Dy \0E\A9\91\83dt\90\86\CD \F2\07\1A\E8\A0\8762\90@\06\11h#0\D2H#\08|h#\834(\06\C4^\00\80IMX\C2aC\80\00A\1F\8A\0B\0C\0B\15X\B0S\87\0B\81\05:@d\DC\A0s|\E8 \19\F4Gj\E4\90\82\0E\12`\1F\A4\06\A2\D1A\1F\16\07\9B\01\1F\D8,H#\8D\D2\91@\06\1Dd`s(\E6\EE\FC\E3\C2=H\E1wR\02\00\80I\22\F0\02\18\1C\04\18Z\5C\F3\C3\1C\1A\16\A6h.\FCX\C09!\D0G\0B:\88C\06i\A4\06c\D0A\1F\E6\0F\8B\83\D1\B0X\C1\1E\A0\C3\B09$\90A\1C>(\12\83\B5\96\0B%h\00\80\09\0A-0]\E0\C0\B9p,\E1GO\CA07\C7\18\E6\A7\A3\8C\0Fc\C0\1F\1D\B4\C0\10`<\8C\86y\05\9B\01\9D\80E\86\C5\A0\0D\1Dp\C2\DE\1C\8F\16\C3<\94\94\01\00\80\09\04\E4\85#\0E\A3`\5CH\0F*\F1c\12X6C-y\99a\A4\86r\F0\01\1D\03\F3\07\9D\809\07\E2\D0A\06\0C\CE\05\8D\DF\81\D7pH\82\02\00\80\89\1A\16\0D\19\C2q\11.E\DC\01Y*\F4\A4\04\13\B0\16\C2eF\9BqL\80\C3\A0\AF\E0\19\1Dd@\17\22\9EB\B9\18\CC\A7\04\05\00\80\89\0A\E88\FC@\80\91\82\82\E9\85", align 1
@bitsleft = internal unnamed_addr global i32 0, align 4
@nextbyte = internal unnamed_addr global i8* getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 0, i32 0), align 4
@lastbyte = internal unnamed_addr global i32 0, align 4
@eof = internal unnamed_addr global i1 false
@sum = internal unnamed_addr global i32 0, align 4
@g3white = internal constant [2304 x i8] c"\00\00\00\00\00\00\00\03\04\00\00\05\06\00\07\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0B\0C\00\00\00\00\00\00\00\00\00C\09\0A\00\00\00\00\00\00B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0E\00\00\00\02\0D\00\00\00\00\00\00\00\00\00\00\00\00\00\00D[\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\11\12\00\00\00\00\00\00\00\00\0F\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\17\18\00\00\00\15\00\00\00\14\00\00\00\00\00\00\1B\00\00\00\16\1D\00\00\00\00\00\00\00\00\00\00\00\1C\00\00\13\19\00\00\1A\00\00\00\00\00\00\00\00\00\00\00E\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1E\1F./\00\00\00\0001\00\00\00\00\00\00\22#$%&'\00\00 !\00\00\00\00\00\00\00\0067\00\00()*+,-\00\00\00\00>?@\01FG\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00<=\00\00\00\00\00\002345\00\0089:;\00\00\00\00\00\00\00\00HI\00KJ\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00XYZ\5C\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00LM\00\00\00\00NOPQRSTUVW\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\FF\00\00\00\00\00\00]\00\00\00^_\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00`abcde\00\00\00\00fghi\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@rowbuf = internal global [1728 x i8] zeroinitializer, align 1
@g3black = internal constant [3072 x i8] c"\00\00\04\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\07\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0A\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0B\0C\00\0D\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0E\00\00\0F\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\00\00B\00\00\00\00\00\00\00\11\12\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\FF\00\00\00\00\00\00]\00\00\00^_\00\00\00\00\00\00\00\00\00\19\1A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\15\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00`abcde\00\00\00\00fghi\00\00\00\005\00\0089\00\00<=\00\00\00\00\00\00FGH\0067\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0034-./0:;>E\00\00\00\00\00\00\00\0012?@\1F !\22)*\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00CD\1B\1C\1D\1E\00\00\00\00#$%&'(\00\00+,\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00KLMN\00\00\00\00UVWX\00\00\00\00YZ\00\00\00\00\00\00\00\00[\5C\00\00\00\00\00\00IJ\00\00\00\00OPQRST\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str2 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind
define i32 @getbit() #0 {
entry:
  %0 = load i32, i32* @bitsleft, align 4, !tbaa !1
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* @bitsleft, align 4, !tbaa !1
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %entry.if.end3_crit_edge

entry.if.end3_crit_edge:                          ; preds = %entry
  %.pre = load i32, i32* @lastbyte, align 4, !tbaa !1
  br label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @nextbyte, align 4, !tbaa !5
  %cmp1 = icmp ult i8* %1, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1, label %if.else, label %if.then2

if.then2:                                         ; preds = %if.then
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  store i1 true, i1* @eof, align 1
  br label %if.end3

if.else:                                          ; preds = %if.then
  %incdec.ptr = getelementptr inbounds i8, i8* %1, i32 1
  store i8* %incdec.ptr, i8** @nextbyte, align 4, !tbaa !5
  %2 = load i8, i8* %1, align 1, !tbaa !7
  %conv = zext i8 %2 to i32
  store i32 %conv, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %if.end3

if.end3:                                          ; preds = %entry.if.end3_crit_edge, %if.then2, %if.else
  %3 = phi i32 [ %.pre, %entry.if.end3_crit_edge ], [ 0, %if.then2 ], [ %conv, %if.else ]
  %and = and i32 %3, 1
  %shr = lshr i32 %3, 1
  store i32 %shr, i32* @lastbyte, align 4, !tbaa !1
  ret i32 %and
}

; Function Attrs: nounwind
define void @skiptoeol() #0 {
entry:
  br label %for.cond.outer.for.cond.outer.split_crit_edge

select.unfold.loopexit:                           ; preds = %getbit.exit
  %.pre29.lcssa = phi i32 [ %.pre29, %getbit.exit ]
  br label %select.unfold

select.unfold:                                    ; preds = %select.unfold.loopexit, %getbit.exit.thread
  %.pre28 = phi i32 [ %dec.i.lcssa, %getbit.exit.thread ], [ %.pre29.lcssa, %select.unfold.loopexit ]
  %inc22 = add nuw nsw i32 %n.0.ph26, 1
  %cmp = icmp slt i32 %inc22, 11
  br i1 %cmp, label %for.cond.outer.for.cond.outer.split_crit_edge, label %while.cond.preheader

while.cond.preheader:                             ; preds = %select.unfold
  %.pre28.lcssa = phi i32 [ %.pre28, %select.unfold ]
  br label %while.cond

for.cond.outer.for.cond.outer.split_crit_edge:    ; preds = %entry, %select.unfold
  %n.0.ph26 = phi i32 [ 0, %entry ], [ %inc22, %select.unfold ]
  br label %for.body

for.body:                                         ; preds = %getbit.exit, %for.cond.outer.for.cond.outer.split_crit_edge
  %0 = load i32, i32* @bitsleft, align 4, !tbaa !1
  %dec.i = add nsw i32 %0, -1
  store i32 %dec.i, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i = icmp slt i32 %0, 1
  br i1 %cmp.i, label %if.then.i, label %entry.if.end3_crit_edge.i

entry.if.end3_crit_edge.i:                        ; preds = %for.body
  %.pre.i = load i32, i32* @lastbyte, align 4, !tbaa !1
  br label %getbit.exit

if.then.i:                                        ; preds = %for.body
  %1 = load i8*, i8** @nextbyte, align 4, !tbaa !5
  %cmp1.i = icmp ult i8* %1, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i, label %if.else.i, label %getbit.exit.thread

getbit.exit.thread:                               ; preds = %if.then.i
  %dec.i.lcssa = phi i32 [ %dec.i, %if.then.i ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  br label %select.unfold

if.else.i:                                        ; preds = %if.then.i
  %incdec.ptr.i = getelementptr inbounds i8, i8* %1, i32 1
  store i8* %incdec.ptr.i, i8** @nextbyte, align 4, !tbaa !5
  %2 = load i8, i8* %1, align 1, !tbaa !7
  %conv.i = zext i8 %2 to i32
  store i32 %conv.i, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit

getbit.exit:                                      ; preds = %entry.if.end3_crit_edge.i, %if.else.i
  %.pre29 = phi i32 [ %dec.i, %entry.if.end3_crit_edge.i ], [ 7, %if.else.i ]
  %3 = phi i32 [ %.pre.i, %entry.if.end3_crit_edge.i ], [ %conv.i, %if.else.i ]
  %and.i = and i32 %3, 1
  %shr.i = lshr i32 %3, 1
  store i32 %shr.i, i32* @lastbyte, align 4, !tbaa !1
  %cmp1 = icmp eq i32 %and.i, 0
  br i1 %cmp1, label %select.unfold.loopexit, label %for.body

while.cond:                                       ; preds = %while.cond.backedge, %while.cond.preheader
  %4 = phi i32 [ %.pre28.lcssa, %while.cond.preheader ], [ %.be, %while.cond.backedge ]
  %dec.i5 = add nsw i32 %4, -1
  store i32 %dec.i5, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i6 = icmp slt i32 %4, 1
  br i1 %cmp.i6, label %if.then.i10, label %entry.if.end3_crit_edge.i8

entry.if.end3_crit_edge.i8:                       ; preds = %while.cond
  %.pre.i7 = load i32, i32* @lastbyte, align 4, !tbaa !1
  br label %getbit.exit17

if.then.i10:                                      ; preds = %while.cond
  %5 = load i8*, i8** @nextbyte, align 4, !tbaa !5
  %cmp1.i9 = icmp ult i8* %5, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i9, label %if.else.i14, label %getbit.exit17.thread

getbit.exit17.thread:                             ; preds = %if.then.i10
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  br label %while.cond.backedge

if.else.i14:                                      ; preds = %if.then.i10
  %incdec.ptr.i12 = getelementptr inbounds i8, i8* %5, i32 1
  store i8* %incdec.ptr.i12, i8** @nextbyte, align 4, !tbaa !5
  %6 = load i8, i8* %5, align 1, !tbaa !7
  %conv.i13 = zext i8 %6 to i32
  store i32 %conv.i13, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit17

getbit.exit17:                                    ; preds = %entry.if.end3_crit_edge.i8, %if.else.i14
  %7 = phi i32 [ %dec.i5, %entry.if.end3_crit_edge.i8 ], [ 7, %if.else.i14 ]
  %8 = phi i32 [ %.pre.i7, %entry.if.end3_crit_edge.i8 ], [ %conv.i13, %if.else.i14 ]
  %and.i15 = and i32 %8, 1
  %shr.i16 = lshr i32 %8, 1
  store i32 %shr.i16, i32* @lastbyte, align 4, !tbaa !1
  %cmp3 = icmp eq i32 %and.i15, 0
  br i1 %cmp3, label %while.cond.backedge, label %while.end

while.cond.backedge:                              ; preds = %getbit.exit17, %getbit.exit17.thread
  %.be = phi i32 [ %7, %getbit.exit17 ], [ %dec.i5, %getbit.exit17.thread ]
  br label %while.cond

while.end:                                        ; preds = %getbit.exit17
  ret void
}

; Function Attrs: nounwind
define void @rowout(i8* nocapture readonly %rowbuf, i32 %maxcol, i32 %currow) #0 {
entry:
  %0 = load i32, i32* @sum, align 4, !tbaa !1
  %cmp4 = icmp sgt i32 %maxcol, 0
  br i1 %cmp4, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %backedge.overflow = icmp eq i32 %maxcol, 0
  br i1 %backedge.overflow, label %for.body.preheader38, label %overflow.checked

overflow.checked:                                 ; preds = %for.body.preheader
  %n.vec = and i32 %maxcol, -8
  %cmp.zero = icmp eq i32 %n.vec, 0
  %ptr.ind.end = getelementptr i8, i8* %rowbuf, i32 %n.vec
  %1 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %0, i32 0
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.phi = phi <4 x i32> [ %7, %vector.body ], [ %1, %vector.body.preheader ]
  %vec.phi10 = phi <4 x i32> [ %8, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %next.gep = getelementptr i8, i8* %rowbuf, i32 %index
  %2 = bitcast i8* %next.gep to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %2, align 1, !tbaa !7
  %next.gep.sum33 = or i32 %index, 4
  %3 = getelementptr i8, i8* %rowbuf, i32 %next.gep.sum33
  %4 = bitcast i8* %3 to <4 x i8>*
  %wide.load26 = load <4 x i8>, <4 x i8>* %4, align 1, !tbaa !7
  %5 = zext <4 x i8> %wide.load to <4 x i32>
  %6 = zext <4 x i8> %wide.load26 to <4 x i32>
  %7 = add <4 x i32> %5, %vec.phi
  %8 = add <4 x i32> %6, %vec.phi10
  %index.next = add i32 %index, 8
  %9 = icmp eq i32 %index.next, %n.vec
  br i1 %9, label %middle.block.loopexit, label %vector.body, !llvm.loop !8

middle.block.loopexit:                            ; preds = %vector.body
  %.lcssa40 = phi <4 x i32> [ %8, %vector.body ]
  %.lcssa = phi <4 x i32> [ %7, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %resume.val8 = phi i8* [ %rowbuf, %overflow.checked ], [ %ptr.ind.end, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <4 x i32> [ %1, %overflow.checked ], [ %.lcssa, %middle.block.loopexit ]
  %rdx.vec.exit.phi29 = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %.lcssa40, %middle.block.loopexit ]
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi29, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx30 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf31 = shufflevector <4 x i32> %bin.rdx30, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx32 = add <4 x i32> %bin.rdx30, %rdx.shuf31
  %10 = extractelement <4 x i32> %bin.rdx32, i32 0
  %cmp.n = icmp eq i32 %resume.val, %maxcol
  br i1 %cmp.n, label %for.end, label %for.body.preheader38

for.body.preheader38:                             ; preds = %middle.block, %for.body.preheader
  %sm.07.ph = phi i32 [ %0, %for.body.preheader ], [ %10, %middle.block ]
  %i.06.ph = phi i32 [ 0, %for.body.preheader ], [ %resume.val, %middle.block ]
  %s.05.ph = phi i8* [ %rowbuf, %for.body.preheader ], [ %resume.val8, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader38, %for.body
  %sm.07 = phi i32 [ %add, %for.body ], [ %sm.07.ph, %for.body.preheader38 ]
  %i.06 = phi i32 [ %inc, %for.body ], [ %i.06.ph, %for.body.preheader38 ]
  %s.05 = phi i8* [ %incdec.ptr, %for.body ], [ %s.05.ph, %for.body.preheader38 ]
  %11 = load i8, i8* %s.05, align 1, !tbaa !7
  %conv = zext i8 %11 to i32
  %add = add i32 %conv, %sm.07
  %inc = add nuw nsw i32 %i.06, 1
  %incdec.ptr = getelementptr inbounds i8, i8* %s.05, i32 1
  %exitcond = icmp eq i32 %inc, %maxcol
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !llvm.loop !11

for.end.loopexit:                                 ; preds = %for.body
  %add.lcssa = phi i32 [ %add, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  %sm.0.lcssa = phi i32 [ %0, %entry ], [ %10, %middle.block ], [ %add.lcssa, %for.end.loopexit ]
  store i32 %sm.0.lcssa, i32* @sum, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  store i1 false, i1* @eof, align 1
  store i32 0, i32* @sum, align 4, !tbaa !1
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  store i32 0, i32* @bitsleft, align 4, !tbaa !1
  store i8* getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 0, i32 0), i8** @nextbyte, align 4, !tbaa !5
  br label %for.cond.outer.for.cond.outer.split_crit_edge.i

select.unfold.i.loopexit:                         ; preds = %getbit.exit.i
  %shr.i.i.lcssa = phi i32 [ %shr.i.i, %getbit.exit.i ]
  %.pre29.i.lcssa = phi i32 [ %.pre29.i, %getbit.exit.i ]
  %.lcssa670 = phi i8* [ %7, %getbit.exit.i ]
  br label %select.unfold.i

select.unfold.i:                                  ; preds = %select.unfold.i.loopexit, %getbit.exit.thread.i
  %.b120304327 = phi i1 [ true, %getbit.exit.thread.i ], [ %.b120304326, %select.unfold.i.loopexit ]
  %0 = phi i8* [ %.lcssa667, %getbit.exit.thread.i ], [ %.lcssa670, %select.unfold.i.loopexit ]
  %.pre.i.i321 = phi i32 [ 0, %getbit.exit.thread.i ], [ %shr.i.i.lcssa, %select.unfold.i.loopexit ]
  %1 = phi i32 [ %dec.i.i.lcssa, %getbit.exit.thread.i ], [ %.pre29.i.lcssa, %select.unfold.i.loopexit ]
  %inc22.i = add nuw nsw i32 %n.0.ph26.i, 1
  %exitcond318 = icmp eq i32 %inc22.i, 11
  br i1 %exitcond318, label %while.cond.i.outer.preheader, label %for.cond.outer.for.cond.outer.split_crit_edge.i

while.cond.i.outer.preheader:                     ; preds = %select.unfold.i
  %.lcssa672 = phi i32 [ %1, %select.unfold.i ]
  %.pre.i.i321.lcssa = phi i32 [ %.pre.i.i321, %select.unfold.i ]
  %.lcssa671 = phi i8* [ %0, %select.unfold.i ]
  %.b120304327.lcssa = phi i1 [ %.b120304327, %select.unfold.i ]
  br label %while.cond.i.outer

for.cond.outer.for.cond.outer.split_crit_edge.i:  ; preds = %select.unfold.i, %entry
  %.b120304326 = phi i1 [ false, %entry ], [ %.b120304327, %select.unfold.i ]
  %2 = phi i8* [ getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 0, i32 0), %entry ], [ %0, %select.unfold.i ]
  %.pre.i.i320 = phi i32 [ 0, %entry ], [ %.pre.i.i321, %select.unfold.i ]
  %3 = phi i32 [ 0, %entry ], [ %1, %select.unfold.i ]
  %n.0.ph26.i = phi i32 [ 0, %entry ], [ %inc22.i, %select.unfold.i ]
  br label %for.body.i

for.body.i:                                       ; preds = %getbit.exit.i, %for.cond.outer.for.cond.outer.split_crit_edge.i
  %4 = phi i8* [ %7, %getbit.exit.i ], [ %2, %for.cond.outer.for.cond.outer.split_crit_edge.i ]
  %.pre.i.i = phi i32 [ %shr.i.i, %getbit.exit.i ], [ %.pre.i.i320, %for.cond.outer.for.cond.outer.split_crit_edge.i ]
  %5 = phi i32 [ %.pre29.i, %getbit.exit.i ], [ %3, %for.cond.outer.for.cond.outer.split_crit_edge.i ]
  %dec.i.i = add nsw i32 %5, -1
  store i32 %dec.i.i, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i.i = icmp slt i32 %5, 1
  br i1 %cmp.i.i, label %if.then.i.i, label %getbit.exit.i

if.then.i.i:                                      ; preds = %for.body.i
  %cmp1.i.i = icmp ult i8* %4, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i.i, label %if.else.i.i, label %getbit.exit.thread.i

getbit.exit.thread.i:                             ; preds = %if.then.i.i
  %dec.i.i.lcssa = phi i32 [ %dec.i.i, %if.then.i.i ]
  %.lcssa667 = phi i8* [ %4, %if.then.i.i ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  br label %select.unfold.i

if.else.i.i:                                      ; preds = %if.then.i.i
  %incdec.ptr.i.i = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr.i.i, i8** @nextbyte, align 4, !tbaa !5
  %6 = load i8, i8* %4, align 1, !tbaa !7
  %conv.i.i = zext i8 %6 to i32
  store i32 %conv.i.i, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit.i

getbit.exit.i:                                    ; preds = %for.body.i, %if.else.i.i
  %7 = phi i8* [ %incdec.ptr.i.i, %if.else.i.i ], [ %4, %for.body.i ]
  %.pre29.i = phi i32 [ 7, %if.else.i.i ], [ %dec.i.i, %for.body.i ]
  %8 = phi i32 [ %conv.i.i, %if.else.i.i ], [ %.pre.i.i, %for.body.i ]
  %and.i.i = and i32 %8, 1
  %shr.i.i = lshr i32 %8, 1
  store i32 %shr.i.i, i32* @lastbyte, align 4, !tbaa !1
  %cmp1.i = icmp eq i32 %and.i.i, 0
  br i1 %cmp1.i, label %select.unfold.i.loopexit, label %for.body.i

while.cond.i:                                     ; preds = %while.cond.i.outer, %getbit.exit17.i
  %9 = phi i8* [ %12, %getbit.exit17.i ], [ %.ph378, %while.cond.i.outer ]
  %.pre.i7.i = phi i32 [ %shr.i16.i, %getbit.exit17.i ], [ %.pre.i7.i.ph, %while.cond.i.outer ]
  %10 = phi i32 [ %13, %getbit.exit17.i ], [ %.ph379, %while.cond.i.outer ]
  %dec.i5.i = add nsw i32 %10, -1
  store i32 %dec.i5.i, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i6.i = icmp slt i32 %10, 1
  br i1 %cmp.i6.i, label %if.then.i10.i, label %getbit.exit17.i

if.then.i10.i:                                    ; preds = %while.cond.i
  %cmp1.i9.i = icmp ult i8* %9, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i9.i, label %if.else.i14.i, label %getbit.exit17.thread.i

getbit.exit17.thread.i:                           ; preds = %if.then.i10.i
  %dec.i5.i.lcssa = phi i32 [ %dec.i5.i, %if.then.i10.i ]
  %.lcssa662 = phi i8* [ %9, %if.then.i10.i ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  br label %while.cond.i.outer

while.cond.i.outer:                               ; preds = %while.cond.i.outer.preheader, %getbit.exit17.thread.i
  %.b120304.ph = phi i1 [ true, %getbit.exit17.thread.i ], [ %.b120304327.lcssa, %while.cond.i.outer.preheader ]
  %.ph378 = phi i8* [ %.lcssa662, %getbit.exit17.thread.i ], [ %.lcssa671, %while.cond.i.outer.preheader ]
  %.pre.i7.i.ph = phi i32 [ 0, %getbit.exit17.thread.i ], [ %.pre.i.i321.lcssa, %while.cond.i.outer.preheader ]
  %.ph379 = phi i32 [ %dec.i5.i.lcssa, %getbit.exit17.thread.i ], [ %.lcssa672, %while.cond.i.outer.preheader ]
  br label %while.cond.i

if.else.i14.i:                                    ; preds = %if.then.i10.i
  %incdec.ptr.i12.i = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr.i12.i, i8** @nextbyte, align 4, !tbaa !5
  %11 = load i8, i8* %9, align 1, !tbaa !7
  %conv.i13.i = zext i8 %11 to i32
  store i32 %conv.i13.i, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit17.i

getbit.exit17.i:                                  ; preds = %while.cond.i, %if.else.i14.i
  %12 = phi i8* [ %incdec.ptr.i12.i, %if.else.i14.i ], [ %9, %while.cond.i ]
  %13 = phi i32 [ 7, %if.else.i14.i ], [ %dec.i5.i, %while.cond.i ]
  %14 = phi i32 [ %conv.i13.i, %if.else.i14.i ], [ %.pre.i7.i, %while.cond.i ]
  %and.i15.i = and i32 %14, 1
  %shr.i16.i = lshr i32 %14, 1
  store i32 %shr.i16.i, i32* @lastbyte, align 4, !tbaa !1
  %cmp3.i = icmp eq i32 %and.i15.i, 0
  br i1 %cmp3.i, label %while.cond.i, label %for.cond.preheader

for.cond.preheader:                               ; preds = %getbit.exit17.i
  %.b120304.ph.lcssa = phi i1 [ %.b120304.ph, %getbit.exit17.i ]
  %shr.i16.i.lcssa = phi i32 [ %shr.i16.i, %getbit.exit17.i ]
  %.lcssa666 = phi i32 [ %13, %getbit.exit17.i ]
  %.lcssa665 = phi i8* [ %12, %getbit.exit17.i ]
  br i1 %.b120304.ph.lcssa, label %if.then93, label %for.body.preheader

for.body.preheader:                               ; preds = %for.cond.preheader
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %middle.block
  %15 = phi i32 [ %108, %middle.block ], [ 0, %for.body.preheader ]
  %16 = phi i8* [ %96, %middle.block ], [ %.lcssa665, %for.body.preheader ]
  %.pre.i270 = phi i32 [ %.pre.i270329, %middle.block ], [ %shr.i16.i.lcssa, %for.body.preheader ]
  %17 = phi i32 [ %97, %middle.block ], [ %.lcssa666, %for.body.preheader ]
  %18 = phi i32 [ %98, %middle.block ], [ 0, %for.body.preheader ]
  %dec.i268 = add nsw i32 %17, -1
  store i32 %dec.i268, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i269 = icmp slt i32 %17, 1
  br i1 %cmp.i269, label %if.then.i273, label %getbit.exit280

if.then.i273:                                     ; preds = %for.body
  %cmp1.i272 = icmp ult i8* %16, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i272, label %if.else.i277, label %if.then2.i274

if.then2.i274:                                    ; preds = %if.then.i273
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  store i1 true, i1* @eof, align 1
  br label %getbit.exit280

if.else.i277:                                     ; preds = %if.then.i273
  %incdec.ptr.i275 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr.i275, i8** @nextbyte, align 4, !tbaa !5
  %19 = load i8, i8* %16, align 1, !tbaa !7
  %conv.i276 = zext i8 %19 to i32
  store i32 %conv.i276, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit280

getbit.exit280:                                   ; preds = %if.then2.i274, %for.body, %if.else.i277
  %.b342 = phi i1 [ false, %if.else.i277 ], [ true, %if.then2.i274 ], [ false, %for.body ]
  %20 = phi i8* [ %incdec.ptr.i275, %if.else.i277 ], [ %16, %if.then2.i274 ], [ %16, %for.body ]
  %21 = phi i32 [ 7, %if.else.i277 ], [ %dec.i268, %if.then2.i274 ], [ %dec.i268, %for.body ]
  %22 = phi i32 [ %conv.i276, %if.else.i277 ], [ 0, %if.then2.i274 ], [ %.pre.i270, %for.body ]
  %shr.i279 = lshr i32 %22, 1
  store i32 %shr.i279, i32* @lastbyte, align 4, !tbaa !1
  %and.i278 = shl i32 %22, 1
  %conv1 = and i32 %and.i278, 2
  %dec.i255 = add nsw i32 %21, -1
  store i32 %dec.i255, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i256 = icmp slt i32 %21, 1
  br i1 %cmp.i256, label %if.then.i260, label %getbit.exit267

if.then.i260:                                     ; preds = %getbit.exit280
  %cmp1.i259 = icmp ult i8* %20, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i259, label %if.else.i264, label %if.then2.i261

if.then2.i261:                                    ; preds = %if.then.i260
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  store i1 true, i1* @eof, align 1
  br label %getbit.exit267

if.else.i264:                                     ; preds = %if.then.i260
  %incdec.ptr.i262 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr.i262, i8** @nextbyte, align 4, !tbaa !5
  %23 = load i8, i8* %20, align 1, !tbaa !7
  %conv.i263 = zext i8 %23 to i32
  store i32 %conv.i263, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit267

getbit.exit267:                                   ; preds = %if.then2.i261, %getbit.exit280, %if.else.i264
  %.b340 = phi i1 [ %.b342, %if.else.i264 ], [ true, %if.then2.i261 ], [ %.b342, %getbit.exit280 ]
  %24 = phi i8* [ %incdec.ptr.i262, %if.else.i264 ], [ %20, %if.then2.i261 ], [ %20, %getbit.exit280 ]
  %25 = phi i32 [ 7, %if.else.i264 ], [ %dec.i255, %if.then2.i261 ], [ %dec.i255, %getbit.exit280 ]
  %26 = phi i32 [ %conv.i263, %if.else.i264 ], [ 0, %if.then2.i261 ], [ %shr.i279, %getbit.exit280 ]
  %and.i265 = and i32 %26, 1
  %shr.i266 = lshr i32 %26, 1
  store i32 %shr.i266, i32* @lastbyte, align 4, !tbaa !1
  %add = or i32 %and.i265, %conv1
  %conv4 = shl nuw nsw i32 %add, 1
  %dec.i242 = add nsw i32 %25, -1
  store i32 %dec.i242, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i243 = icmp slt i32 %25, 1
  br i1 %cmp.i243, label %if.then.i247, label %getbit.exit254

if.then.i247:                                     ; preds = %getbit.exit267
  %cmp1.i246 = icmp ult i8* %24, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i246, label %if.else.i251, label %if.then2.i248

if.then2.i248:                                    ; preds = %if.then.i247
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  store i1 true, i1* @eof, align 1
  br label %getbit.exit254

if.else.i251:                                     ; preds = %if.then.i247
  %incdec.ptr.i249 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr.i249, i8** @nextbyte, align 4, !tbaa !5
  %27 = load i8, i8* %24, align 1, !tbaa !7
  %conv.i250 = zext i8 %27 to i32
  store i32 %conv.i250, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit254

getbit.exit254:                                   ; preds = %getbit.exit267, %if.then2.i248, %if.else.i251
  %.b339 = phi i1 [ true, %if.then2.i248 ], [ %.b340, %if.else.i251 ], [ %.b340, %getbit.exit267 ]
  %28 = phi i8* [ %24, %if.then2.i248 ], [ %incdec.ptr.i249, %if.else.i251 ], [ %24, %getbit.exit267 ]
  %29 = phi i32 [ %dec.i242, %if.then2.i248 ], [ 7, %if.else.i251 ], [ %dec.i242, %getbit.exit267 ]
  %30 = phi i32 [ 0, %if.then2.i248 ], [ %conv.i250, %if.else.i251 ], [ %shr.i266, %getbit.exit267 ]
  %and.i252 = and i32 %30, 1
  %shr.i253 = lshr i32 %30, 1
  store i32 %shr.i253, i32* @lastbyte, align 4, !tbaa !1
  %add7 = or i32 %and.i252, %conv4
  br label %for.cond9.outer

for.cond9.outer:                                  ; preds = %for.cond9.outer.backedge, %getbit.exit254
  %.b120369 = phi i1 [ %.b339, %getbit.exit254 ], [ %.b120369.be, %for.cond9.outer.backedge ]
  %.b334 = phi i1 [ %.b339, %getbit.exit254 ], [ %.b334.be, %for.cond9.outer.backedge ]
  %31 = phi i8* [ %28, %getbit.exit254 ], [ %.be, %for.cond9.outer.backedge ]
  %.pre.i270331 = phi i32 [ %shr.i253, %getbit.exit254 ], [ %.pre.i270331.be, %for.cond9.outer.backedge ]
  %32 = phi i32 [ %29, %getbit.exit254 ], [ %.be538, %for.cond9.outer.backedge ]
  %code.0.ph = phi i32 [ %add7, %getbit.exit254 ], [ %code.0.ph.be, %for.cond9.outer.backedge ]
  %runtab.0.ph = phi i8* [ getelementptr inbounds ([2304 x i8], [2304 x i8]* @g3white, i32 0, i32 0), %getbit.exit254 ], [ %runtab.0.ph.be, %for.cond9.outer.backedge ]
  %runetab.0.ph = phi i8* [ getelementptr inbounds ([2304 x i8], [2304 x i8]* @g3white, i32 1, i32 0), %getbit.exit254 ], [ %runetab.0.ph.be, %for.cond9.outer.backedge ]
  %runlen.0.ph = phi i32 [ 0, %getbit.exit254 ], [ %runlen.2, %for.cond9.outer.backedge ]
  %runcolor.0.ph = phi i32 [ 0, %getbit.exit254 ], [ %runcolor.0.ph.be, %for.cond9.outer.backedge ]
  %curcol.0.ph = phi i32 [ 0, %getbit.exit254 ], [ %curcol.2, %for.cond9.outer.backedge ]
  br label %for.cond9

for.cond9:                                        ; preds = %for.cond9.outer, %if.then
  %.b120368 = phi i1 [ %.b120367, %if.then ], [ %.b120369, %for.cond9.outer ]
  %.b = phi i1 [ %.b333, %if.then ], [ %.b334, %for.cond9.outer ]
  %33 = phi i8* [ %36, %if.then ], [ %31, %for.cond9.outer ]
  %.pre.i231 = phi i32 [ %shr.i240, %if.then ], [ %.pre.i270331, %for.cond9.outer ]
  %34 = phi i32 [ %37, %if.then ], [ %32, %for.cond9.outer ]
  %code.0 = phi i32 [ %add16, %if.then ], [ %code.0.ph, %for.cond9.outer ]
  %runtab.0 = phi i8* [ %add.ptr, %if.then ], [ %runtab.0.ph, %for.cond9.outer ]
  br i1 %.b, label %overflow.checked.loopexit537, label %for.body12

for.body12:                                       ; preds = %for.cond9
  %conv13 = shl nsw i32 %code.0, 1
  %shl14 = and i32 %conv13, 510
  %dec.i229 = add nsw i32 %34, -1
  store i32 %dec.i229, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i230 = icmp slt i32 %34, 1
  br i1 %cmp.i230, label %if.then.i234, label %getbit.exit241

if.then.i234:                                     ; preds = %for.body12
  %cmp1.i233 = icmp ult i8* %33, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i233, label %if.else.i238, label %if.then2.i235

if.then2.i235:                                    ; preds = %if.then.i234
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  store i1 true, i1* @eof, align 1
  br label %getbit.exit241

if.else.i238:                                     ; preds = %if.then.i234
  %incdec.ptr.i236 = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %incdec.ptr.i236, i8** @nextbyte, align 4, !tbaa !5
  %35 = load i8, i8* %33, align 1, !tbaa !7
  %conv.i237 = zext i8 %35 to i32
  store i32 %conv.i237, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit241

getbit.exit241:                                   ; preds = %for.body12, %if.then2.i235, %if.else.i238
  %.b120367 = phi i1 [ true, %if.then2.i235 ], [ %.b120368, %if.else.i238 ], [ %.b120368, %for.body12 ]
  %.b333 = phi i1 [ true, %if.then2.i235 ], [ false, %if.else.i238 ], [ false, %for.body12 ]
  %36 = phi i8* [ %33, %if.then2.i235 ], [ %incdec.ptr.i236, %if.else.i238 ], [ %33, %for.body12 ]
  %37 = phi i32 [ %dec.i229, %if.then2.i235 ], [ 7, %if.else.i238 ], [ %dec.i229, %for.body12 ]
  %38 = phi i32 [ 0, %if.then2.i235 ], [ %conv.i237, %if.else.i238 ], [ %.pre.i231, %for.body12 ]
  %and.i239 = and i32 %38, 1
  %shr.i240 = lshr i32 %38, 1
  store i32 %shr.i240, i32* @lastbyte, align 4, !tbaa !1
  %add16 = or i32 %and.i239, %shl14
  %idxprom = and i32 %add16, 255
  %arrayidx = getelementptr inbounds i8, i8* %runtab.0, i32 %idxprom
  %39 = load i8, i8* %arrayidx, align 1, !tbaa !7
  %cmp = icmp eq i8 %39, 0
  br i1 %cmp, label %if.then, label %if.end28

if.then:                                          ; preds = %getbit.exit241
  %add.ptr = getelementptr inbounds i8, i8* %runtab.0, i32 256
  %cmp20 = icmp ult i8* %add.ptr, %runetab.0.ph
  br i1 %cmp20, label %for.cond9, label %if.end

if.end:                                           ; preds = %if.then
  %curcol.0.ph.lcssa635 = phi i32 [ %curcol.0.ph, %if.then ]
  %idxprom.lcssa630 = phi i32 [ %idxprom, %if.then ]
  %shr.i240.lcssa626 = phi i32 [ %shr.i240, %if.then ]
  %.lcssa624 = phi i32 [ %37, %if.then ]
  %.lcssa621 = phi i8* [ %36, %if.then ]
  %.b120367.lcssa615 = phi i1 [ %.b120367, %if.then ]
  %cmp24 = icmp eq i32 %idxprom.lcssa630, 1
  br i1 %cmp24, label %if.then34, label %for.cond.outer.for.cond.outer.split_crit_edge.i196.preheader

for.cond.outer.for.cond.outer.split_crit_edge.i196.preheader: ; preds = %if.end
  br label %for.cond.outer.for.cond.outer.split_crit_edge.i196

select.unfold.i194.loopexit:                      ; preds = %getbit.exit.i212
  %shr.i.i210.lcssa = phi i32 [ %shr.i.i210, %getbit.exit.i212 ]
  %.pre29.i208.lcssa = phi i32 [ %.pre29.i208, %getbit.exit.i212 ]
  %.lcssa651 = phi i8* [ %47, %getbit.exit.i212 ]
  br label %select.unfold.i194

select.unfold.i194:                               ; preds = %select.unfold.i194.loopexit, %getbit.exit.thread.i204
  %.b120365 = phi i1 [ true, %getbit.exit.thread.i204 ], [ %.b120366, %select.unfold.i194.loopexit ]
  %.pre.i.i200353 = phi i32 [ 0, %getbit.exit.thread.i204 ], [ %shr.i.i210.lcssa, %select.unfold.i194.loopexit ]
  %40 = phi i32 [ %dec.i.i197.lcssa, %getbit.exit.thread.i204 ], [ %.pre29.i208.lcssa, %select.unfold.i194.loopexit ]
  %41 = phi i8* [ %.lcssa648, %getbit.exit.thread.i204 ], [ %.lcssa651, %select.unfold.i194.loopexit ]
  %inc22.i192 = add nuw nsw i32 %n.0.ph26.i195, 1
  %exitcond317 = icmp eq i32 %inc22.i192, 11
  br i1 %exitcond317, label %while.cond.i215.outer.preheader, label %for.cond.outer.for.cond.outer.split_crit_edge.i196

while.cond.i215.outer.preheader:                  ; preds = %select.unfold.i194
  %.lcssa653 = phi i8* [ %41, %select.unfold.i194 ]
  %.lcssa652 = phi i32 [ %40, %select.unfold.i194 ]
  %.pre.i.i200353.lcssa = phi i32 [ %.pre.i.i200353, %select.unfold.i194 ]
  %.b120365.lcssa = phi i1 [ %.b120365, %select.unfold.i194 ]
  br label %while.cond.i215.outer

for.cond.outer.for.cond.outer.split_crit_edge.i196: ; preds = %for.cond.outer.for.cond.outer.split_crit_edge.i196.preheader, %select.unfold.i194
  %.b120366 = phi i1 [ %.b120365, %select.unfold.i194 ], [ %.b120367.lcssa615, %for.cond.outer.for.cond.outer.split_crit_edge.i196.preheader ]
  %.pre.i.i200352 = phi i32 [ %.pre.i.i200353, %select.unfold.i194 ], [ %shr.i240.lcssa626, %for.cond.outer.for.cond.outer.split_crit_edge.i196.preheader ]
  %42 = phi i32 [ %40, %select.unfold.i194 ], [ %.lcssa624, %for.cond.outer.for.cond.outer.split_crit_edge.i196.preheader ]
  %43 = phi i8* [ %41, %select.unfold.i194 ], [ %.lcssa621, %for.cond.outer.for.cond.outer.split_crit_edge.i196.preheader ]
  %n.0.ph26.i195 = phi i32 [ %inc22.i192, %select.unfold.i194 ], [ 0, %for.cond.outer.for.cond.outer.split_crit_edge.i196.preheader ]
  br label %for.body.i199

for.body.i199:                                    ; preds = %getbit.exit.i212, %for.cond.outer.for.cond.outer.split_crit_edge.i196
  %.pre.i.i200 = phi i32 [ %shr.i.i210, %getbit.exit.i212 ], [ %.pre.i.i200352, %for.cond.outer.for.cond.outer.split_crit_edge.i196 ]
  %44 = phi i32 [ %.pre29.i208, %getbit.exit.i212 ], [ %42, %for.cond.outer.for.cond.outer.split_crit_edge.i196 ]
  %45 = phi i8* [ %47, %getbit.exit.i212 ], [ %43, %for.cond.outer.for.cond.outer.split_crit_edge.i196 ]
  %dec.i.i197 = add nsw i32 %44, -1
  store i32 %dec.i.i197, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i.i198 = icmp slt i32 %44, 1
  br i1 %cmp.i.i198, label %if.then.i.i203, label %getbit.exit.i212

if.then.i.i203:                                   ; preds = %for.body.i199
  %cmp1.i.i202 = icmp ult i8* %45, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i.i202, label %if.else.i.i207, label %getbit.exit.thread.i204

getbit.exit.thread.i204:                          ; preds = %if.then.i.i203
  %dec.i.i197.lcssa = phi i32 [ %dec.i.i197, %if.then.i.i203 ]
  %.lcssa648 = phi i8* [ %45, %if.then.i.i203 ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  br label %select.unfold.i194

if.else.i.i207:                                   ; preds = %if.then.i.i203
  %incdec.ptr.i.i205 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr.i.i205, i8** @nextbyte, align 4, !tbaa !5
  %46 = load i8, i8* %45, align 1, !tbaa !7
  %conv.i.i206 = zext i8 %46 to i32
  store i32 %conv.i.i206, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit.i212

getbit.exit.i212:                                 ; preds = %for.body.i199, %if.else.i.i207
  %47 = phi i8* [ %incdec.ptr.i.i205, %if.else.i.i207 ], [ %45, %for.body.i199 ]
  %.pre29.i208 = phi i32 [ 7, %if.else.i.i207 ], [ %dec.i.i197, %for.body.i199 ]
  %48 = phi i32 [ %conv.i.i206, %if.else.i.i207 ], [ %.pre.i.i200, %for.body.i199 ]
  %and.i.i209 = and i32 %48, 1
  %shr.i.i210 = lshr i32 %48, 1
  store i32 %shr.i.i210, i32* @lastbyte, align 4, !tbaa !1
  %cmp1.i211 = icmp eq i32 %and.i.i209, 0
  br i1 %cmp1.i211, label %select.unfold.i194.loopexit, label %for.body.i199

while.cond.i215:                                  ; preds = %while.cond.i215.outer, %getbit.exit17.i227
  %.pre.i7.i216 = phi i32 [ %shr.i16.i225, %getbit.exit17.i227 ], [ %.pre.i7.i216.ph, %while.cond.i215.outer ]
  %49 = phi i8* [ %52, %getbit.exit17.i227 ], [ %.ph, %while.cond.i215.outer ]
  %50 = phi i32 [ %53, %getbit.exit17.i227 ], [ %.ph373, %while.cond.i215.outer ]
  %dec.i5.i213 = add nsw i32 %50, -1
  store i32 %dec.i5.i213, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i6.i214 = icmp slt i32 %50, 1
  br i1 %cmp.i6.i214, label %if.then.i10.i219, label %getbit.exit17.i227

if.then.i10.i219:                                 ; preds = %while.cond.i215
  %cmp1.i9.i218 = icmp ult i8* %49, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i9.i218, label %if.else.i14.i223, label %getbit.exit17.thread.i220

getbit.exit17.thread.i220:                        ; preds = %if.then.i10.i219
  %dec.i5.i213.lcssa = phi i32 [ %dec.i5.i213, %if.then.i10.i219 ]
  %.lcssa654 = phi i8* [ %49, %if.then.i10.i219 ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  br label %while.cond.i215.outer

while.cond.i215.outer:                            ; preds = %while.cond.i215.outer.preheader, %getbit.exit17.thread.i220
  %.b120364.ph = phi i1 [ true, %getbit.exit17.thread.i220 ], [ %.b120365.lcssa, %while.cond.i215.outer.preheader ]
  %.pre.i7.i216.ph = phi i32 [ 0, %getbit.exit17.thread.i220 ], [ %.pre.i.i200353.lcssa, %while.cond.i215.outer.preheader ]
  %.ph = phi i8* [ %.lcssa654, %getbit.exit17.thread.i220 ], [ %.lcssa653, %while.cond.i215.outer.preheader ]
  %.ph373 = phi i32 [ %dec.i5.i213.lcssa, %getbit.exit17.thread.i220 ], [ %.lcssa652, %while.cond.i215.outer.preheader ]
  br label %while.cond.i215

if.else.i14.i223:                                 ; preds = %if.then.i10.i219
  %incdec.ptr.i12.i221 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %incdec.ptr.i12.i221, i8** @nextbyte, align 4, !tbaa !5
  %51 = load i8, i8* %49, align 1, !tbaa !7
  %conv.i13.i222 = zext i8 %51 to i32
  store i32 %conv.i13.i222, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit17.i227

getbit.exit17.i227:                               ; preds = %while.cond.i215, %if.else.i14.i223
  %52 = phi i8* [ %incdec.ptr.i12.i221, %if.else.i14.i223 ], [ %49, %while.cond.i215 ]
  %53 = phi i32 [ 7, %if.else.i14.i223 ], [ %dec.i5.i213, %while.cond.i215 ]
  %54 = phi i32 [ %conv.i13.i222, %if.else.i14.i223 ], [ %.pre.i7.i216, %while.cond.i215 ]
  %and.i15.i224 = and i32 %54, 1
  %shr.i16.i225 = lshr i32 %54, 1
  store i32 %shr.i16.i225, i32* @lastbyte, align 4, !tbaa !1
  %cmp3.i226 = icmp eq i32 %and.i15.i224, 0
  br i1 %cmp3.i226, label %while.cond.i215, label %overflow.checked.loopexit

if.end28:                                         ; preds = %getbit.exit241
  %.lcssa631 = phi i8 [ %39, %getbit.exit241 ]
  %shr.i240.lcssa = phi i32 [ %shr.i240, %getbit.exit241 ]
  %.lcssa623 = phi i32 [ %37, %getbit.exit241 ]
  %.lcssa620 = phi i8* [ %36, %getbit.exit241 ]
  %.b333.lcssa = phi i1 [ %.b333, %getbit.exit241 ]
  %.b120367.lcssa = phi i1 [ %.b120367, %getbit.exit241 ]
  %conv18.le = zext i8 %.lcssa631 to i32
  %dec = add nsw i32 %conv18.le, -1
  %cmp29 = icmp sgt i32 %dec, 63
  br i1 %cmp29, label %if.then31, label %if.else45

if.then31:                                        ; preds = %if.end28
  %cmp32 = icmp sgt i32 %dec, 253
  br i1 %cmp32, label %if.then34.loopexit, label %if.end43

if.then34.loopexit:                               ; preds = %if.then31
  %curcol.0.ph.lcssa634 = phi i32 [ %curcol.0.ph, %if.then31 ]
  %shr.i240.lcssa.lcssa629 = phi i32 [ %shr.i240.lcssa, %if.then31 ]
  %.lcssa623.lcssa625 = phi i32 [ %.lcssa623, %if.then31 ]
  %.lcssa620.lcssa622 = phi i8* [ %.lcssa620, %if.then31 ]
  %.b120367.lcssa.lcssa618 = phi i1 [ %.b120367.lcssa, %if.then31 ]
  br label %if.then34

if.then34:                                        ; preds = %if.then34.loopexit, %if.end
  %curcol.0.ph636 = phi i32 [ %curcol.0.ph.lcssa634, %if.then34.loopexit ], [ %curcol.0.ph.lcssa635, %if.end ]
  %shr.i240627 = phi i32 [ %shr.i240.lcssa.lcssa629, %if.then34.loopexit ], [ %shr.i240.lcssa626, %if.end ]
  %55 = phi i32 [ %.lcssa623.lcssa625, %if.then34.loopexit ], [ %.lcssa624, %if.end ]
  %56 = phi i8* [ %.lcssa620.lcssa622, %if.then34.loopexit ], [ %.lcssa621, %if.end ]
  %.b120367616 = phi i1 [ %.b120367.lcssa.lcssa618, %if.then34.loopexit ], [ %.b120367.lcssa615, %if.end ]
  %cmp35 = icmp eq i32 %curcol.0.ph636, 0
  br i1 %cmp35, label %if.else, label %overflow.checked

if.else:                                          ; preds = %if.then34
  %inc = add nsw i32 %18, 1
  %cmp38 = icmp sgt i32 %18, 1
  br i1 %cmp38, label %if.then40, label %overflow.checked

if.then40:                                        ; preds = %if.else
  store i1 true, i1* @eof, align 1
  br label %overflow.checked

if.end43:                                         ; preds = %if.then31
  %sub = shl nuw nsw i32 %conv18.le, 6
  %mul = add i32 %runlen.0.ph, -4160
  %add44 = add i32 %mul, %sub
  br label %if.end67

if.else45:                                        ; preds = %if.end28
  %add46 = add nsw i32 %dec, %runlen.0.ph
  %add47 = add nsw i32 %add46, %curcol.0.ph
  %cmp48 = icmp sgt i32 %add47, 1728
  %sub51 = sub nsw i32 1728, %curcol.0.ph
  %sub51.add46 = select i1 %cmp48, i32 %sub51, i32 %add46
  %cmp55301 = icmp sgt i32 %sub51.add46, 0
  br i1 %cmp55301, label %for.body57.lr.ph, label %for.end

for.body57.lr.ph:                                 ; preds = %if.else45
  %conv58 = trunc i32 %runcolor.0.ph to i8
  %57 = sub i32 0, %runlen.0.ph
  %58 = sub i32 %57, %curcol.0.ph
  %59 = sub i32 %58, %conv18.le
  %60 = icmp sgt i32 %59, -1729
  %smax = select i1 %60, i32 %59, i32 -1729
  %61 = add i32 %curcol.0.ph, %smax
  %62 = icmp sgt i32 %61, -2
  %.op = add i32 %61, 1
  %63 = select i1 %62, i32 %.op, i32 -1
  %scevgep = getelementptr [1728 x i8], [1728 x i8]* @rowbuf, i32 0, i32 %curcol.0.ph
  %64 = sub i32 %63, %curcol.0.ph
  %65 = sub i32 %64, %smax
  call void @llvm.memset.p0i8.i32(i8* %scevgep, i8 %conv58, i32 %65, i32 1, i1 false)
  %66 = sub i32 %63, %smax
  br label %for.end

for.end:                                          ; preds = %for.body57.lr.ph, %if.else45
  %curcol.1.lcssa = phi i32 [ %66, %for.body57.lr.ph ], [ %curcol.0.ph, %if.else45 ]
  %cmp61 = icmp sgt i32 %curcol.1.lcssa, 1727
  br i1 %cmp61, label %for.cond.outer.for.cond.outer.split_crit_edge.i158.preheader, label %if.end64

for.cond.outer.for.cond.outer.split_crit_edge.i158.preheader: ; preds = %for.end
  %shr.i240.lcssa.lcssa = phi i32 [ %shr.i240.lcssa, %for.end ]
  %.lcssa623.lcssa = phi i32 [ %.lcssa623, %for.end ]
  %.lcssa620.lcssa = phi i8* [ %.lcssa620, %for.end ]
  %.b120367.lcssa.lcssa = phi i1 [ %.b120367.lcssa, %for.end ]
  br label %for.cond.outer.for.cond.outer.split_crit_edge.i158

select.unfold.i156.loopexit:                      ; preds = %getbit.exit.i174
  %shr.i.i172.lcssa = phi i32 [ %shr.i.i172, %getbit.exit.i174 ]
  %.pre29.i170.lcssa = phi i32 [ %.pre29.i170, %getbit.exit.i174 ]
  %.lcssa640 = phi i8* [ %74, %getbit.exit.i174 ]
  br label %select.unfold.i156

select.unfold.i156:                               ; preds = %select.unfold.i156.loopexit, %getbit.exit.thread.i166
  %.b120361 = phi i1 [ true, %getbit.exit.thread.i166 ], [ %.b120362, %select.unfold.i156.loopexit ]
  %.pre.i.i162348 = phi i32 [ 0, %getbit.exit.thread.i166 ], [ %shr.i.i172.lcssa, %select.unfold.i156.loopexit ]
  %67 = phi i32 [ %dec.i.i159.lcssa, %getbit.exit.thread.i166 ], [ %.pre29.i170.lcssa, %select.unfold.i156.loopexit ]
  %68 = phi i8* [ %.lcssa637, %getbit.exit.thread.i166 ], [ %.lcssa640, %select.unfold.i156.loopexit ]
  %inc22.i154 = add nuw nsw i32 %n.0.ph26.i157, 1
  %exitcond = icmp eq i32 %inc22.i154, 11
  br i1 %exitcond, label %while.cond.i177.outer.preheader, label %for.cond.outer.for.cond.outer.split_crit_edge.i158

while.cond.i177.outer.preheader:                  ; preds = %select.unfold.i156
  %.lcssa642 = phi i8* [ %68, %select.unfold.i156 ]
  %.lcssa641 = phi i32 [ %67, %select.unfold.i156 ]
  %.pre.i.i162348.lcssa = phi i32 [ %.pre.i.i162348, %select.unfold.i156 ]
  %.b120361.lcssa = phi i1 [ %.b120361, %select.unfold.i156 ]
  br label %while.cond.i177.outer

for.cond.outer.for.cond.outer.split_crit_edge.i158: ; preds = %for.cond.outer.for.cond.outer.split_crit_edge.i158.preheader, %select.unfold.i156
  %.b120362 = phi i1 [ %.b120361, %select.unfold.i156 ], [ %.b120367.lcssa.lcssa, %for.cond.outer.for.cond.outer.split_crit_edge.i158.preheader ]
  %.pre.i.i162347 = phi i32 [ %.pre.i.i162348, %select.unfold.i156 ], [ %shr.i240.lcssa.lcssa, %for.cond.outer.for.cond.outer.split_crit_edge.i158.preheader ]
  %69 = phi i32 [ %67, %select.unfold.i156 ], [ %.lcssa623.lcssa, %for.cond.outer.for.cond.outer.split_crit_edge.i158.preheader ]
  %70 = phi i8* [ %68, %select.unfold.i156 ], [ %.lcssa620.lcssa, %for.cond.outer.for.cond.outer.split_crit_edge.i158.preheader ]
  %n.0.ph26.i157 = phi i32 [ %inc22.i154, %select.unfold.i156 ], [ 0, %for.cond.outer.for.cond.outer.split_crit_edge.i158.preheader ]
  br label %for.body.i161

for.body.i161:                                    ; preds = %getbit.exit.i174, %for.cond.outer.for.cond.outer.split_crit_edge.i158
  %.pre.i.i162 = phi i32 [ %shr.i.i172, %getbit.exit.i174 ], [ %.pre.i.i162347, %for.cond.outer.for.cond.outer.split_crit_edge.i158 ]
  %71 = phi i32 [ %.pre29.i170, %getbit.exit.i174 ], [ %69, %for.cond.outer.for.cond.outer.split_crit_edge.i158 ]
  %72 = phi i8* [ %74, %getbit.exit.i174 ], [ %70, %for.cond.outer.for.cond.outer.split_crit_edge.i158 ]
  %dec.i.i159 = add nsw i32 %71, -1
  store i32 %dec.i.i159, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i.i160 = icmp slt i32 %71, 1
  br i1 %cmp.i.i160, label %if.then.i.i165, label %getbit.exit.i174

if.then.i.i165:                                   ; preds = %for.body.i161
  %cmp1.i.i164 = icmp ult i8* %72, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i.i164, label %if.else.i.i169, label %getbit.exit.thread.i166

getbit.exit.thread.i166:                          ; preds = %if.then.i.i165
  %dec.i.i159.lcssa = phi i32 [ %dec.i.i159, %if.then.i.i165 ]
  %.lcssa637 = phi i8* [ %72, %if.then.i.i165 ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  br label %select.unfold.i156

if.else.i.i169:                                   ; preds = %if.then.i.i165
  %incdec.ptr.i.i167 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %incdec.ptr.i.i167, i8** @nextbyte, align 4, !tbaa !5
  %73 = load i8, i8* %72, align 1, !tbaa !7
  %conv.i.i168 = zext i8 %73 to i32
  store i32 %conv.i.i168, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit.i174

getbit.exit.i174:                                 ; preds = %for.body.i161, %if.else.i.i169
  %74 = phi i8* [ %incdec.ptr.i.i167, %if.else.i.i169 ], [ %72, %for.body.i161 ]
  %.pre29.i170 = phi i32 [ 7, %if.else.i.i169 ], [ %dec.i.i159, %for.body.i161 ]
  %75 = phi i32 [ %conv.i.i168, %if.else.i.i169 ], [ %.pre.i.i162, %for.body.i161 ]
  %and.i.i171 = and i32 %75, 1
  %shr.i.i172 = lshr i32 %75, 1
  store i32 %shr.i.i172, i32* @lastbyte, align 4, !tbaa !1
  %cmp1.i173 = icmp eq i32 %and.i.i171, 0
  br i1 %cmp1.i173, label %select.unfold.i156.loopexit, label %for.body.i161

while.cond.i177:                                  ; preds = %while.cond.i177.outer, %getbit.exit17.i189
  %.pre.i7.i178 = phi i32 [ %shr.i16.i187, %getbit.exit17.i189 ], [ %.pre.i7.i178.ph, %while.cond.i177.outer ]
  %76 = phi i8* [ %79, %getbit.exit17.i189 ], [ %.ph375, %while.cond.i177.outer ]
  %77 = phi i32 [ %80, %getbit.exit17.i189 ], [ %.ph376, %while.cond.i177.outer ]
  %dec.i5.i175 = add nsw i32 %77, -1
  store i32 %dec.i5.i175, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i6.i176 = icmp slt i32 %77, 1
  br i1 %cmp.i6.i176, label %if.then.i10.i181, label %getbit.exit17.i189

if.then.i10.i181:                                 ; preds = %while.cond.i177
  %cmp1.i9.i180 = icmp ult i8* %76, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i9.i180, label %if.else.i14.i185, label %getbit.exit17.thread.i182

getbit.exit17.thread.i182:                        ; preds = %if.then.i10.i181
  %dec.i5.i175.lcssa = phi i32 [ %dec.i5.i175, %if.then.i10.i181 ]
  %.lcssa643 = phi i8* [ %76, %if.then.i10.i181 ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  br label %while.cond.i177.outer

while.cond.i177.outer:                            ; preds = %while.cond.i177.outer.preheader, %getbit.exit17.thread.i182
  %.b120360.ph = phi i1 [ true, %getbit.exit17.thread.i182 ], [ %.b120361.lcssa, %while.cond.i177.outer.preheader ]
  %.pre.i7.i178.ph = phi i32 [ 0, %getbit.exit17.thread.i182 ], [ %.pre.i.i162348.lcssa, %while.cond.i177.outer.preheader ]
  %.ph375 = phi i8* [ %.lcssa643, %getbit.exit17.thread.i182 ], [ %.lcssa642, %while.cond.i177.outer.preheader ]
  %.ph376 = phi i32 [ %dec.i5.i175.lcssa, %getbit.exit17.thread.i182 ], [ %.lcssa641, %while.cond.i177.outer.preheader ]
  br label %while.cond.i177

if.else.i14.i185:                                 ; preds = %if.then.i10.i181
  %incdec.ptr.i12.i183 = getelementptr inbounds i8, i8* %76, i32 1
  store i8* %incdec.ptr.i12.i183, i8** @nextbyte, align 4, !tbaa !5
  %78 = load i8, i8* %76, align 1, !tbaa !7
  %conv.i13.i184 = zext i8 %78 to i32
  store i32 %conv.i13.i184, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit17.i189

getbit.exit17.i189:                               ; preds = %while.cond.i177, %if.else.i14.i185
  %79 = phi i8* [ %incdec.ptr.i12.i183, %if.else.i14.i185 ], [ %76, %while.cond.i177 ]
  %80 = phi i32 [ 7, %if.else.i14.i185 ], [ %dec.i5.i175, %while.cond.i177 ]
  %81 = phi i32 [ %conv.i13.i184, %if.else.i14.i185 ], [ %.pre.i7.i178, %while.cond.i177 ]
  %and.i15.i186 = and i32 %81, 1
  %shr.i16.i187 = lshr i32 %81, 1
  store i32 %shr.i16.i187, i32* @lastbyte, align 4, !tbaa !1
  %cmp3.i188 = icmp eq i32 %and.i15.i186, 0
  br i1 %cmp3.i188, label %while.cond.i177, label %overflow.checked.loopexit536

if.end64:                                         ; preds = %for.end
  %cmp65 = icmp eq i32 %runcolor.0.ph, 0
  %cond = zext i1 %cmp65 to i32
  br label %if.end67

if.end67:                                         ; preds = %if.end64, %if.end43
  %shr.i240628 = phi i32 [ %shr.i240.lcssa, %if.end43 ], [ %shr.i240.lcssa, %if.end64 ]
  %82 = phi i32 [ %.lcssa623, %if.end43 ], [ %.lcssa623, %if.end64 ]
  %83 = phi i8* [ %.lcssa620, %if.end43 ], [ %.lcssa620, %if.end64 ]
  %.b120367617 = phi i1 [ %.b120367.lcssa, %if.end43 ], [ %.b120367.lcssa, %if.end64 ]
  %runlen.2 = phi i32 [ %add44, %if.end43 ], [ 0, %if.end64 ]
  %runcolor.1 = phi i32 [ %runcolor.0.ph, %if.end43 ], [ %cond, %if.end64 ]
  %curcol.2 = phi i32 [ %curcol.0.ph, %if.end43 ], [ %curcol.1.lcssa, %if.end64 ]
  %cmp68 = icmp eq i32 %runcolor.1, 1
  %dec.i140 = add nsw i32 %82, -1
  store i32 %dec.i140, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i141 = icmp slt i32 %.lcssa623, 1
  br i1 %cmp.i141, label %if.then.i145, label %getbit.exit152

if.then.i145:                                     ; preds = %if.end67
  %cmp1.i144 = icmp ult i8* %83, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i144, label %if.else.i149, label %if.then2.i146

if.then2.i146:                                    ; preds = %if.then.i145
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  store i1 true, i1* @eof, align 1
  br label %getbit.exit152

if.else.i149:                                     ; preds = %if.then.i145
  %incdec.ptr.i147 = getelementptr inbounds i8, i8* %83, i32 1
  store i8* %incdec.ptr.i147, i8** @nextbyte, align 4, !tbaa !5
  %84 = load i8, i8* %83, align 1, !tbaa !7
  %conv.i148 = zext i8 %84 to i32
  store i32 %conv.i148, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit152

getbit.exit152:                                   ; preds = %if.end67, %if.then2.i146, %if.else.i149
  %.b120358 = phi i1 [ true, %if.then2.i146 ], [ %.b120367617, %if.else.i149 ], [ %.b120367617, %if.end67 ]
  %.b338 = phi i1 [ true, %if.then2.i146 ], [ %.b333.lcssa, %if.else.i149 ], [ %.b333.lcssa, %if.end67 ]
  %85 = phi i8* [ %83, %if.then2.i146 ], [ %incdec.ptr.i147, %if.else.i149 ], [ %83, %if.end67 ]
  %86 = phi i32 [ %dec.i140, %if.then2.i146 ], [ 7, %if.else.i149 ], [ %dec.i140, %if.end67 ]
  %87 = phi i32 [ 0, %if.then2.i146 ], [ %conv.i148, %if.else.i149 ], [ %shr.i240628, %if.end67 ]
  %and.i150 = and i32 %87, 1
  %shr.i151 = lshr i32 %87, 1
  store i32 %shr.i151, i32* @lastbyte, align 4, !tbaa !1
  br i1 %cmp68, label %for.cond9.outer.backedge, label %if.else73

if.else73:                                        ; preds = %getbit.exit152
  %conv76 = shl nuw nsw i32 %and.i150, 1
  %dec.i127 = add nsw i32 %86, -1
  store i32 %dec.i127, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i128 = icmp slt i32 %86, 1
  br i1 %cmp.i128, label %if.then.i132, label %getbit.exit139

if.then.i132:                                     ; preds = %if.else73
  %cmp1.i131 = icmp ult i8* %85, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i131, label %if.else.i136, label %if.then2.i133

if.then2.i133:                                    ; preds = %if.then.i132
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  store i1 true, i1* @eof, align 1
  br label %getbit.exit139

if.else.i136:                                     ; preds = %if.then.i132
  %incdec.ptr.i134 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %incdec.ptr.i134, i8** @nextbyte, align 4, !tbaa !5
  %88 = load i8, i8* %85, align 1, !tbaa !7
  %conv.i135 = zext i8 %88 to i32
  store i32 %conv.i135, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit139

getbit.exit139:                                   ; preds = %if.else73, %if.then2.i133, %if.else.i136
  %.b120357 = phi i1 [ true, %if.then2.i133 ], [ %.b120358, %if.else.i136 ], [ %.b120358, %if.else73 ]
  %89 = phi i32 [ %dec.i127, %if.then2.i133 ], [ 7, %if.else.i136 ], [ %dec.i127, %if.else73 ]
  %.b337 = phi i1 [ true, %if.then2.i133 ], [ %.b338, %if.else.i136 ], [ %.b338, %if.else73 ]
  %90 = phi i8* [ %85, %if.then2.i133 ], [ %incdec.ptr.i134, %if.else.i136 ], [ %85, %if.else73 ]
  %91 = phi i32 [ 0, %if.then2.i133 ], [ %conv.i135, %if.else.i136 ], [ %shr.i151, %if.else73 ]
  %and.i137 = and i32 %91, 1
  %shr.i138 = lshr i32 %91, 1
  store i32 %shr.i138, i32* @lastbyte, align 4, !tbaa !1
  %add79 = or i32 %and.i137, %conv76
  %conv81 = shl nuw nsw i32 %add79, 1
  %shl82 = and i32 %conv81, 6
  %dec.i = add nsw i32 %89, -1
  store i32 %dec.i, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i123 = icmp slt i32 %89, 1
  br i1 %cmp.i123, label %if.then.i, label %getbit.exit

if.then.i:                                        ; preds = %getbit.exit139
  %cmp1.i124 = icmp ult i8* %90, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i124, label %if.else.i, label %if.then2.i

if.then2.i:                                       ; preds = %if.then.i
  store i32 0, i32* @lastbyte, align 4, !tbaa !1
  store i1 true, i1* @eof, align 1
  br label %getbit.exit

if.else.i:                                        ; preds = %if.then.i
  %incdec.ptr.i125 = getelementptr inbounds i8, i8* %90, i32 1
  store i8* %incdec.ptr.i125, i8** @nextbyte, align 4, !tbaa !5
  %92 = load i8, i8* %90, align 1, !tbaa !7
  %conv.i126 = zext i8 %92 to i32
  store i32 %conv.i126, i32* @lastbyte, align 4, !tbaa !1
  store i32 7, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit

getbit.exit:                                      ; preds = %getbit.exit139, %if.then2.i, %if.else.i
  %.b120371 = phi i1 [ true, %if.then2.i ], [ %.b120357, %if.else.i ], [ %.b120357, %getbit.exit139 ]
  %.b336 = phi i1 [ true, %if.then2.i ], [ %.b337, %if.else.i ], [ %.b337, %getbit.exit139 ]
  %93 = phi i8* [ %90, %if.then2.i ], [ %incdec.ptr.i125, %if.else.i ], [ %90, %getbit.exit139 ]
  %94 = phi i32 [ %dec.i, %if.then2.i ], [ 7, %if.else.i ], [ %dec.i, %getbit.exit139 ]
  %95 = phi i32 [ 0, %if.then2.i ], [ %conv.i126, %if.else.i ], [ %shr.i138, %getbit.exit139 ]
  %and.i = and i32 %95, 1
  %shr.i = lshr i32 %95, 1
  store i32 %shr.i, i32* @lastbyte, align 4, !tbaa !1
  %add84 = or i32 %and.i, %shl82
  br label %for.cond9.outer.backedge

for.cond9.outer.backedge:                         ; preds = %getbit.exit, %getbit.exit152
  %.b120369.be = phi i1 [ %.b120358, %getbit.exit152 ], [ %.b120371, %getbit.exit ]
  %.b334.be = phi i1 [ %.b338, %getbit.exit152 ], [ %.b336, %getbit.exit ]
  %.be = phi i8* [ %85, %getbit.exit152 ], [ %93, %getbit.exit ]
  %.pre.i270331.be = phi i32 [ %shr.i151, %getbit.exit152 ], [ %shr.i, %getbit.exit ]
  %.be538 = phi i32 [ %86, %getbit.exit152 ], [ %94, %getbit.exit ]
  %code.0.ph.be = phi i32 [ %and.i150, %getbit.exit152 ], [ %add84, %getbit.exit ]
  %runtab.0.ph.be = phi i8* [ getelementptr inbounds ([3072 x i8], [3072 x i8]* @g3black, i32 0, i32 0), %getbit.exit152 ], [ getelementptr inbounds ([2304 x i8], [2304 x i8]* @g3white, i32 0, i32 0), %getbit.exit ]
  %runetab.0.ph.be = phi i8* [ getelementptr inbounds ([3072 x i8], [3072 x i8]* @g3black, i32 1, i32 0), %getbit.exit152 ], [ getelementptr inbounds ([2304 x i8], [2304 x i8]* @g3white, i32 1, i32 0), %getbit.exit ]
  %runcolor.0.ph.be = phi i32 [ 1, %getbit.exit152 ], [ %runcolor.1, %getbit.exit ]
  br label %for.cond9.outer

overflow.checked.loopexit:                        ; preds = %getbit.exit17.i227
  %.b120364.ph.lcssa = phi i1 [ %.b120364.ph, %getbit.exit17.i227 ]
  %shr.i16.i225.lcssa = phi i32 [ %shr.i16.i225, %getbit.exit17.i227 ]
  %.lcssa658 = phi i32 [ %53, %getbit.exit17.i227 ]
  %.lcssa657 = phi i8* [ %52, %getbit.exit17.i227 ]
  br label %overflow.checked

overflow.checked.loopexit536:                     ; preds = %getbit.exit17.i189
  %.b120360.ph.lcssa = phi i1 [ %.b120360.ph, %getbit.exit17.i189 ]
  %shr.i16.i187.lcssa = phi i32 [ %shr.i16.i187, %getbit.exit17.i189 ]
  %.lcssa647 = phi i32 [ %80, %getbit.exit17.i189 ]
  %.lcssa646 = phi i8* [ %79, %getbit.exit17.i189 ]
  br label %overflow.checked

overflow.checked.loopexit537:                     ; preds = %for.cond9
  %.lcssa612 = phi i32 [ %34, %for.cond9 ]
  %.pre.i231.lcssa = phi i32 [ %.pre.i231, %for.cond9 ]
  %.lcssa = phi i8* [ %33, %for.cond9 ]
  %.b120368.lcssa = phi i1 [ %.b120368, %for.cond9 ]
  br label %overflow.checked

overflow.checked:                                 ; preds = %overflow.checked.loopexit537, %overflow.checked.loopexit536, %overflow.checked.loopexit, %if.else, %if.then40, %if.then34
  %.b120 = phi i1 [ true, %if.then40 ], [ %.b120367616, %if.else ], [ %.b120367616, %if.then34 ], [ %.b120364.ph.lcssa, %overflow.checked.loopexit ], [ %.b120360.ph.lcssa, %overflow.checked.loopexit536 ], [ %.b120368.lcssa, %overflow.checked.loopexit537 ]
  %96 = phi i8* [ %56, %if.then40 ], [ %56, %if.else ], [ %56, %if.then34 ], [ %.lcssa657, %overflow.checked.loopexit ], [ %.lcssa646, %overflow.checked.loopexit536 ], [ %.lcssa, %overflow.checked.loopexit537 ]
  %.pre.i270329 = phi i32 [ %shr.i240627, %if.then40 ], [ %shr.i240627, %if.else ], [ %shr.i240627, %if.then34 ], [ %shr.i16.i225.lcssa, %overflow.checked.loopexit ], [ %shr.i16.i187.lcssa, %overflow.checked.loopexit536 ], [ %.pre.i231.lcssa, %overflow.checked.loopexit537 ]
  %97 = phi i32 [ %55, %if.then40 ], [ %55, %if.else ], [ %55, %if.then34 ], [ %.lcssa658, %overflow.checked.loopexit ], [ %.lcssa647, %overflow.checked.loopexit536 ], [ %.lcssa612, %overflow.checked.loopexit537 ]
  %98 = phi i32 [ %inc, %if.then40 ], [ %inc, %if.else ], [ 0, %if.then34 ], [ %18, %overflow.checked.loopexit ], [ %18, %overflow.checked.loopexit536 ], [ %18, %overflow.checked.loopexit537 ]
  %99 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %15, i32 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %overflow.checked
  %index = phi i32 [ 0, %overflow.checked ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %99, %overflow.checked ], [ %105, %vector.body ]
  %vec.phi510 = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %106, %vector.body ]
  %next.gep = getelementptr [1728 x i8], [1728 x i8]* @rowbuf, i32 0, i32 %index
  %100 = bitcast i8* %next.gep to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %100, align 1, !tbaa !7
  %next.gep.sum531 = or i32 %index, 4
  %101 = getelementptr [1728 x i8], [1728 x i8]* @rowbuf, i32 0, i32 %next.gep.sum531
  %102 = bitcast i8* %101 to <4 x i8>*
  %wide.load526 = load <4 x i8>, <4 x i8>* %102, align 1, !tbaa !7
  %103 = zext <4 x i8> %wide.load to <4 x i32>
  %104 = zext <4 x i8> %wide.load526 to <4 x i32>
  %105 = add <4 x i32> %103, %vec.phi
  %106 = add <4 x i32> %104, %vec.phi510
  %index.next = add i32 %index, 8
  %107 = icmp eq i32 %index.next, 1728
  br i1 %107, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %.lcssa660 = phi <4 x i32> [ %106, %vector.body ]
  %.lcssa659 = phi <4 x i32> [ %105, %vector.body ]
  %bin.rdx = add <4 x i32> %.lcssa660, %.lcssa659
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx528 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf529 = shufflevector <4 x i32> %bin.rdx528, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx530 = add <4 x i32> %bin.rdx528, %rdx.shuf529
  %108 = extractelement <4 x i32> %bin.rdx530, i32 0
  store i32 %108, i32* @sum, align 4, !tbaa !1
  br i1 %.b120, label %for.end90, label %for.body

for.end90:                                        ; preds = %middle.block
  %.lcssa661 = phi i32 [ %108, %middle.block ]
  %phitmp = icmp eq i32 %.lcssa661, 11296
  br i1 %phitmp, label %if.else95, label %if.then93

if.then93:                                        ; preds = %for.cond.preheader, %for.end90
  %puts121 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

if.else95:                                        ; preds = %for.end90
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %if.else95, %if.then93
  %retval.0 = phi i32 [ 15, %if.then93 ], [ 66, %if.else95 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!3, !3, i64 0}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !12, !9, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !9, !10}
