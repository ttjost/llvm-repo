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
@str3 = private unnamed_addr constant [4 x i8] c"666\00"
@str4 = private unnamed_addr constant [5 x i8] c"here\00"

; Function Attrs: nounwind
define i8* @memset(i8* %s, i32 %c, i32 %n) #0 {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %c to i8
  %n.vec = and i32 %n, -32
  %cmp.zero = icmp eq i32 %n.vec, 0
  %ptr.ind.end = getelementptr i8, i8* %s, i32 %n.vec
  %ind.end = sub i32 %n, %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %while.body.lr.ph
  %broadcast.splatinsert71 = insertelement <16 x i8> undef, i8 %conv, i32 0
  %broadcast.splat72 = shufflevector <16 x i8> %broadcast.splatinsert71, <16 x i8> undef, <16 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i8, i8* %s, i32 %index
  %0 = bitcast i8* %next.gep to <16 x i8>*
  store <16 x i8> %broadcast.splat72, <16 x i8>* %0, align 1, !tbaa !1
  %next.gep.sum89 = or i32 %index, 16
  %1 = getelementptr i8, i8* %s, i32 %next.gep.sum89
  %2 = bitcast i8* %1 to <16 x i8>*
  store <16 x i8> %broadcast.splat72, <16 x i8>* %2, align 1, !tbaa !1
  %index.next = add i32 %index, 32
  %3 = icmp eq i32 %index.next, %n.vec
  br i1 %3, label %middle.block.loopexit, label %vector.body, !llvm.loop !4

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %while.body.lr.ph
  %resume.val = phi i8* [ %s, %while.body.lr.ph ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val5 = phi i32 [ %n, %while.body.lr.ph ], [ %ind.end, %middle.block.loopexit ]
  %new.indc.resume.val = phi i32 [ 0, %while.body.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %new.indc.resume.val, %n
  br i1 %cmp.n, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %middle.block
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %p.04 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %while.body.preheader ]
  %n.addr.03 = phi i32 [ %dec, %while.body ], [ %resume.val5, %while.body.preheader ]
  %dec = add i32 %n.addr.03, -1
  %incdec.ptr = getelementptr inbounds i8, i8* %p.04, i32 1
  store i8 %conv, i8* %p.04, align 1, !tbaa !1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.end.loopexit, label %while.body, !llvm.loop !7

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %middle.block, %entry
  ret i8* %s
}

; Function Attrs: nounwind
define i32 @getbit() #0 {
entry:
  %0 = load i32, i32* @bitsleft, align 4, !tbaa !9
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* @bitsleft, align 4, !tbaa !9
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %entry.if.end3_crit_edge

entry.if.end3_crit_edge:                          ; preds = %entry
  %.pre = load i32, i32* @lastbyte, align 4, !tbaa !9
  br label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1 = icmp ult i8* %1, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1, label %if.else, label %if.then2

if.then2:                                         ; preds = %if.then
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  store i1 true, i1* @eof, align 1
  br label %if.end3

if.else:                                          ; preds = %if.then
  %incdec.ptr = getelementptr inbounds i8, i8* %1, i32 1
  store i8* %incdec.ptr, i8** @nextbyte, align 4, !tbaa !11
  %2 = load i8, i8* %1, align 1, !tbaa !1
  %conv = zext i8 %2 to i32
  store i32 %conv, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %if.end3

if.end3:                                          ; preds = %entry.if.end3_crit_edge, %if.then2, %if.else
  %3 = phi i32 [ %.pre, %entry.if.end3_crit_edge ], [ 0, %if.then2 ], [ %conv, %if.else ]
  %and = and i32 %3, 1
  %shr = lshr i32 %3, 1
  store i32 %shr, i32* @lastbyte, align 4, !tbaa !9
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
  %0 = load i32, i32* @bitsleft, align 4, !tbaa !9
  %dec.i = add nsw i32 %0, -1
  store i32 %dec.i, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i = icmp slt i32 %0, 1
  br i1 %cmp.i, label %if.then.i, label %entry.if.end3_crit_edge.i

entry.if.end3_crit_edge.i:                        ; preds = %for.body
  %.pre.i = load i32, i32* @lastbyte, align 4, !tbaa !9
  br label %getbit.exit

if.then.i:                                        ; preds = %for.body
  %1 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i = icmp ult i8* %1, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i, label %if.else.i, label %getbit.exit.thread

getbit.exit.thread:                               ; preds = %if.then.i
  %dec.i.lcssa = phi i32 [ %dec.i, %if.then.i ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  br label %select.unfold

if.else.i:                                        ; preds = %if.then.i
  %incdec.ptr.i = getelementptr inbounds i8, i8* %1, i32 1
  store i8* %incdec.ptr.i, i8** @nextbyte, align 4, !tbaa !11
  %2 = load i8, i8* %1, align 1, !tbaa !1
  %conv.i = zext i8 %2 to i32
  store i32 %conv.i, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit

getbit.exit:                                      ; preds = %entry.if.end3_crit_edge.i, %if.else.i
  %.pre29 = phi i32 [ %dec.i, %entry.if.end3_crit_edge.i ], [ 7, %if.else.i ]
  %3 = phi i32 [ %.pre.i, %entry.if.end3_crit_edge.i ], [ %conv.i, %if.else.i ]
  %and.i = and i32 %3, 1
  %shr.i = lshr i32 %3, 1
  store i32 %shr.i, i32* @lastbyte, align 4, !tbaa !9
  %cmp1 = icmp eq i32 %and.i, 0
  br i1 %cmp1, label %select.unfold.loopexit, label %for.body

while.cond:                                       ; preds = %while.cond.backedge, %while.cond.preheader
  %4 = phi i32 [ %.pre28.lcssa, %while.cond.preheader ], [ %.be, %while.cond.backedge ]
  %dec.i5 = add nsw i32 %4, -1
  store i32 %dec.i5, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i6 = icmp slt i32 %4, 1
  br i1 %cmp.i6, label %if.then.i10, label %entry.if.end3_crit_edge.i8

entry.if.end3_crit_edge.i8:                       ; preds = %while.cond
  %.pre.i7 = load i32, i32* @lastbyte, align 4, !tbaa !9
  br label %getbit.exit17

if.then.i10:                                      ; preds = %while.cond
  %5 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i9 = icmp ult i8* %5, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i9, label %if.else.i14, label %getbit.exit17.thread

getbit.exit17.thread:                             ; preds = %if.then.i10
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  br label %while.cond.backedge

if.else.i14:                                      ; preds = %if.then.i10
  %incdec.ptr.i12 = getelementptr inbounds i8, i8* %5, i32 1
  store i8* %incdec.ptr.i12, i8** @nextbyte, align 4, !tbaa !11
  %6 = load i8, i8* %5, align 1, !tbaa !1
  %conv.i13 = zext i8 %6 to i32
  store i32 %conv.i13, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit17

getbit.exit17:                                    ; preds = %entry.if.end3_crit_edge.i8, %if.else.i14
  %7 = phi i32 [ %dec.i5, %entry.if.end3_crit_edge.i8 ], [ 7, %if.else.i14 ]
  %8 = phi i32 [ %.pre.i7, %entry.if.end3_crit_edge.i8 ], [ %conv.i13, %if.else.i14 ]
  %and.i15 = and i32 %8, 1
  %shr.i16 = lshr i32 %8, 1
  store i32 %shr.i16, i32* @lastbyte, align 4, !tbaa !9
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
  %0 = load i32, i32* @sum, align 4, !tbaa !9
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
  %wide.load = load <4 x i8>, <4 x i8>* %2, align 1, !tbaa !1
  %next.gep.sum33 = or i32 %index, 4
  %3 = getelementptr i8, i8* %rowbuf, i32 %next.gep.sum33
  %4 = bitcast i8* %3 to <4 x i8>*
  %wide.load26 = load <4 x i8>, <4 x i8>* %4, align 1, !tbaa !1
  %5 = zext <4 x i8> %wide.load to <4 x i32>
  %6 = zext <4 x i8> %wide.load26 to <4 x i32>
  %7 = add <4 x i32> %5, %vec.phi
  %8 = add <4 x i32> %6, %vec.phi10
  %index.next = add i32 %index, 8
  %9 = icmp eq i32 %index.next, %n.vec
  br i1 %9, label %middle.block.loopexit, label %vector.body, !llvm.loop !13

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
  %11 = load i8, i8* %s.05, align 1, !tbaa !1
  %conv = zext i8 %11 to i32
  %add = add i32 %conv, %sm.07
  %inc = add nuw nsw i32 %i.06, 1
  %incdec.ptr = getelementptr inbounds i8, i8* %s.05, i32 1
  %exitcond = icmp eq i32 %inc, %maxcol
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !llvm.loop !14

for.end.loopexit:                                 ; preds = %for.body
  %add.lcssa = phi i32 [ %add, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  %sm.0.lcssa = phi i32 [ %0, %entry ], [ %10, %middle.block ], [ %add.lcssa, %for.end.loopexit ]
  store i32 %sm.0.lcssa, i32* @sum, align 4, !tbaa !9
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  store i1 false, i1* @eof, align 1
  store i32 0, i32* @sum, align 4, !tbaa !9
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  store i32 0, i32* @bitsleft, align 4, !tbaa !9
  store i8* getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 0, i32 0), i8** @nextbyte, align 4, !tbaa !11
  br label %for.cond.outer.for.cond.outer.split_crit_edge.i

select.unfold.i.loopexit:                         ; preds = %getbit.exit.i
  %shr.i.i.lcssa = phi i32 [ %shr.i.i, %getbit.exit.i ]
  %.pre29.i.lcssa = phi i32 [ %.pre29.i, %getbit.exit.i ]
  %.lcssa530 = phi i8* [ %7, %getbit.exit.i ]
  br label %select.unfold.i

select.unfold.i:                                  ; preds = %select.unfold.i.loopexit, %getbit.exit.thread.i
  %.b121306329 = phi i1 [ true, %getbit.exit.thread.i ], [ %.b121306328, %select.unfold.i.loopexit ]
  %0 = phi i8* [ %.lcssa527, %getbit.exit.thread.i ], [ %.lcssa530, %select.unfold.i.loopexit ]
  %.pre.i.i323 = phi i32 [ 0, %getbit.exit.thread.i ], [ %shr.i.i.lcssa, %select.unfold.i.loopexit ]
  %1 = phi i32 [ %dec.i.i.lcssa, %getbit.exit.thread.i ], [ %.pre29.i.lcssa, %select.unfold.i.loopexit ]
  %inc22.i = add nuw nsw i32 %n.0.ph26.i, 1
  %exitcond320 = icmp eq i32 %inc22.i, 11
  br i1 %exitcond320, label %while.cond.i.outer.preheader, label %for.cond.outer.for.cond.outer.split_crit_edge.i

while.cond.i.outer.preheader:                     ; preds = %select.unfold.i
  %.lcssa532 = phi i32 [ %1, %select.unfold.i ]
  %.pre.i.i323.lcssa = phi i32 [ %.pre.i.i323, %select.unfold.i ]
  %.lcssa531 = phi i8* [ %0, %select.unfold.i ]
  %.b121306329.lcssa = phi i1 [ %.b121306329, %select.unfold.i ]
  br label %while.cond.i.outer

for.cond.outer.for.cond.outer.split_crit_edge.i:  ; preds = %select.unfold.i, %entry
  %.b121306328 = phi i1 [ false, %entry ], [ %.b121306329, %select.unfold.i ]
  %2 = phi i8* [ getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 0, i32 0), %entry ], [ %0, %select.unfold.i ]
  %.pre.i.i322 = phi i32 [ 0, %entry ], [ %.pre.i.i323, %select.unfold.i ]
  %3 = phi i32 [ 0, %entry ], [ %1, %select.unfold.i ]
  %n.0.ph26.i = phi i32 [ 0, %entry ], [ %inc22.i, %select.unfold.i ]
  br label %for.body.i

for.body.i:                                       ; preds = %getbit.exit.i, %for.cond.outer.for.cond.outer.split_crit_edge.i
  %4 = phi i8* [ %7, %getbit.exit.i ], [ %2, %for.cond.outer.for.cond.outer.split_crit_edge.i ]
  %.pre.i.i = phi i32 [ %shr.i.i, %getbit.exit.i ], [ %.pre.i.i322, %for.cond.outer.for.cond.outer.split_crit_edge.i ]
  %5 = phi i32 [ %.pre29.i, %getbit.exit.i ], [ %3, %for.cond.outer.for.cond.outer.split_crit_edge.i ]
  %dec.i.i = add nsw i32 %5, -1
  store i32 %dec.i.i, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i.i = icmp slt i32 %5, 1
  br i1 %cmp.i.i, label %if.then.i.i, label %getbit.exit.i

if.then.i.i:                                      ; preds = %for.body.i
  %cmp1.i.i = icmp ult i8* %4, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i.i, label %if.else.i.i, label %getbit.exit.thread.i

getbit.exit.thread.i:                             ; preds = %if.then.i.i
  %dec.i.i.lcssa = phi i32 [ %dec.i.i, %if.then.i.i ]
  %.lcssa527 = phi i8* [ %4, %if.then.i.i ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  br label %select.unfold.i

if.else.i.i:                                      ; preds = %if.then.i.i
  %incdec.ptr.i.i = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr.i.i, i8** @nextbyte, align 4, !tbaa !11
  %6 = load i8, i8* %4, align 1, !tbaa !1
  %conv.i.i = zext i8 %6 to i32
  store i32 %conv.i.i, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit.i

getbit.exit.i:                                    ; preds = %for.body.i, %if.else.i.i
  %7 = phi i8* [ %incdec.ptr.i.i, %if.else.i.i ], [ %4, %for.body.i ]
  %.pre29.i = phi i32 [ 7, %if.else.i.i ], [ %dec.i.i, %for.body.i ]
  %8 = phi i32 [ %conv.i.i, %if.else.i.i ], [ %.pre.i.i, %for.body.i ]
  %and.i.i = and i32 %8, 1
  %shr.i.i = lshr i32 %8, 1
  store i32 %shr.i.i, i32* @lastbyte, align 4, !tbaa !9
  %cmp1.i = icmp eq i32 %and.i.i, 0
  br i1 %cmp1.i, label %select.unfold.i.loopexit, label %for.body.i

while.cond.i:                                     ; preds = %while.cond.i.outer, %getbit.exit17.i
  %9 = phi i8* [ %12, %getbit.exit17.i ], [ %.ph364, %while.cond.i.outer ]
  %.pre.i7.i = phi i32 [ %shr.i16.i, %getbit.exit17.i ], [ %.pre.i7.i.ph, %while.cond.i.outer ]
  %10 = phi i32 [ %13, %getbit.exit17.i ], [ %.ph365, %while.cond.i.outer ]
  %dec.i5.i = add nsw i32 %10, -1
  store i32 %dec.i5.i, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i6.i = icmp slt i32 %10, 1
  br i1 %cmp.i6.i, label %if.then.i10.i, label %getbit.exit17.i

if.then.i10.i:                                    ; preds = %while.cond.i
  %cmp1.i9.i = icmp ult i8* %9, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i9.i, label %if.else.i14.i, label %getbit.exit17.thread.i

getbit.exit17.thread.i:                           ; preds = %if.then.i10.i
  %dec.i5.i.lcssa = phi i32 [ %dec.i5.i, %if.then.i10.i ]
  %.lcssa524 = phi i8* [ %9, %if.then.i10.i ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  br label %while.cond.i.outer

while.cond.i.outer:                               ; preds = %while.cond.i.outer.preheader, %getbit.exit17.thread.i
  %.b121306.ph = phi i1 [ true, %getbit.exit17.thread.i ], [ %.b121306329.lcssa, %while.cond.i.outer.preheader ]
  %.ph364 = phi i8* [ %.lcssa524, %getbit.exit17.thread.i ], [ %.lcssa531, %while.cond.i.outer.preheader ]
  %.pre.i7.i.ph = phi i32 [ 0, %getbit.exit17.thread.i ], [ %.pre.i.i323.lcssa, %while.cond.i.outer.preheader ]
  %.ph365 = phi i32 [ %dec.i5.i.lcssa, %getbit.exit17.thread.i ], [ %.lcssa532, %while.cond.i.outer.preheader ]
  br label %while.cond.i

if.else.i14.i:                                    ; preds = %if.then.i10.i
  %incdec.ptr.i12.i = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr.i12.i, i8** @nextbyte, align 4, !tbaa !11
  %11 = load i8, i8* %9, align 1, !tbaa !1
  %conv.i13.i = zext i8 %11 to i32
  store i32 %conv.i13.i, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit17.i

getbit.exit17.i:                                  ; preds = %while.cond.i, %if.else.i14.i
  %12 = phi i8* [ %incdec.ptr.i12.i, %if.else.i14.i ], [ %9, %while.cond.i ]
  %13 = phi i32 [ 7, %if.else.i14.i ], [ %dec.i5.i, %while.cond.i ]
  %14 = phi i32 [ %conv.i13.i, %if.else.i14.i ], [ %.pre.i7.i, %while.cond.i ]
  %and.i15.i = and i32 %14, 1
  %shr.i16.i = lshr i32 %14, 1
  store i32 %shr.i16.i, i32* @lastbyte, align 4, !tbaa !9
  %cmp3.i = icmp eq i32 %and.i15.i, 0
  br i1 %cmp3.i, label %while.cond.i, label %for.cond.preheader

for.cond.preheader:                               ; preds = %getbit.exit17.i
  %.b121306.ph.lcssa = phi i1 [ %.b121306.ph, %getbit.exit17.i ]
  br i1 %.b121306.ph.lcssa, label %if.then94, label %for.body.preheader

for.body.preheader:                               ; preds = %for.cond.preheader
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %middle.block
  %15 = phi i32 [ %81, %middle.block ], [ 0, %for.body.preheader ]
  %puts123 = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str4, i32 0, i32 0))
  %16 = load i32, i32* @bitsleft, align 4, !tbaa !9
  %dec.i270 = add nsw i32 %16, -1
  store i32 %dec.i270, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i271 = icmp slt i32 %16, 1
  br i1 %cmp.i271, label %if.then.i275, label %entry.if.end3_crit_edge.i273

entry.if.end3_crit_edge.i273:                     ; preds = %for.body
  %.pre.i272 = load i32, i32* @lastbyte, align 4, !tbaa !9
  br label %getbit.exit282

if.then.i275:                                     ; preds = %for.body
  %17 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i274 = icmp ult i8* %17, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i274, label %if.else.i279, label %if.then2.i276

if.then2.i276:                                    ; preds = %if.then.i275
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  store i1 true, i1* @eof, align 1
  br label %getbit.exit282

if.else.i279:                                     ; preds = %if.then.i275
  %incdec.ptr.i277 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr.i277, i8** @nextbyte, align 4, !tbaa !11
  %18 = load i8, i8* %17, align 1, !tbaa !1
  %conv.i278 = zext i8 %18 to i32
  store i32 %conv.i278, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit282

getbit.exit282:                                   ; preds = %entry.if.end3_crit_edge.i273, %if.then2.i276, %if.else.i279
  %19 = phi i32 [ 7, %if.else.i279 ], [ %dec.i270, %if.then2.i276 ], [ %dec.i270, %entry.if.end3_crit_edge.i273 ]
  %20 = phi i32 [ %conv.i278, %if.else.i279 ], [ 0, %if.then2.i276 ], [ %.pre.i272, %entry.if.end3_crit_edge.i273 ]
  %shr.i281 = lshr i32 %20, 1
  store i32 %shr.i281, i32* @lastbyte, align 4, !tbaa !9
  %and.i280 = shl i32 %20, 1
  %conv2 = and i32 %and.i280, 2
  %dec.i257 = add nsw i32 %19, -1
  store i32 %dec.i257, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i258 = icmp slt i32 %19, 1
  br i1 %cmp.i258, label %if.then.i262, label %getbit.exit269

if.then.i262:                                     ; preds = %getbit.exit282
  %21 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i261 = icmp ult i8* %21, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i261, label %if.else.i266, label %if.then2.i263

if.then2.i263:                                    ; preds = %if.then.i262
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  store i1 true, i1* @eof, align 1
  br label %getbit.exit269

if.else.i266:                                     ; preds = %if.then.i262
  %incdec.ptr.i264 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr.i264, i8** @nextbyte, align 4, !tbaa !11
  %22 = load i8, i8* %21, align 1, !tbaa !1
  %conv.i265 = zext i8 %22 to i32
  store i32 %conv.i265, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit269

getbit.exit269:                                   ; preds = %if.then2.i263, %getbit.exit282, %if.else.i266
  %23 = phi i32 [ 7, %if.else.i266 ], [ %dec.i257, %getbit.exit282 ], [ %dec.i257, %if.then2.i263 ]
  %24 = phi i32 [ %conv.i265, %if.else.i266 ], [ %shr.i281, %getbit.exit282 ], [ 0, %if.then2.i263 ]
  %and.i267 = and i32 %24, 1
  %shr.i268 = lshr i32 %24, 1
  store i32 %shr.i268, i32* @lastbyte, align 4, !tbaa !9
  %add = or i32 %and.i267, %conv2
  %conv5 = shl nuw nsw i32 %add, 1
  %dec.i244 = add nsw i32 %23, -1
  store i32 %dec.i244, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i245 = icmp slt i32 %23, 1
  br i1 %cmp.i245, label %if.then.i249, label %getbit.exit256

if.then.i249:                                     ; preds = %getbit.exit269
  %25 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i248 = icmp ult i8* %25, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i248, label %if.else.i253, label %if.then2.i250

if.then2.i250:                                    ; preds = %if.then.i249
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  store i1 true, i1* @eof, align 1
  br label %getbit.exit256

if.else.i253:                                     ; preds = %if.then.i249
  %incdec.ptr.i251 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr.i251, i8** @nextbyte, align 4, !tbaa !11
  %26 = load i8, i8* %25, align 1, !tbaa !1
  %conv.i252 = zext i8 %26 to i32
  store i32 %conv.i252, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit256

getbit.exit256:                                   ; preds = %getbit.exit269, %if.then2.i250, %if.else.i253
  %27 = phi i32 [ %dec.i244, %if.then2.i250 ], [ 7, %if.else.i253 ], [ %dec.i244, %getbit.exit269 ]
  %28 = phi i32 [ 0, %if.then2.i250 ], [ %conv.i252, %if.else.i253 ], [ %shr.i268, %getbit.exit269 ]
  %and.i254 = and i32 %28, 1
  %shr.i255 = lshr i32 %28, 1
  store i32 %shr.i255, i32* @lastbyte, align 4, !tbaa !9
  %add8 = or i32 %and.i254, %conv5
  %.b.pre.pre = load i1, i1* @eof, align 1
  br label %for.cond10.outer

for.cond10.outer:                                 ; preds = %for.cond10.outer.backedge, %getbit.exit256
  %.b.pre = phi i1 [ %.b.pre.pre, %getbit.exit256 ], [ %.b.pre.be, %for.cond10.outer.backedge ]
  %.pre.i233333 = phi i32 [ %shr.i255, %getbit.exit256 ], [ %.pre.i233333.be, %for.cond10.outer.backedge ]
  %29 = phi i32 [ %27, %getbit.exit256 ], [ %.be, %for.cond10.outer.backedge ]
  %code.0.ph = phi i32 [ %add8, %getbit.exit256 ], [ %code.0.ph.be, %for.cond10.outer.backedge ]
  %runtab.0.ph = phi i8* [ getelementptr inbounds ([2304 x i8], [2304 x i8]* @g3white, i32 0, i32 0), %getbit.exit256 ], [ %runtab.0.ph.be, %for.cond10.outer.backedge ]
  %runetab.0.ph = phi i8* [ getelementptr inbounds ([2304 x i8], [2304 x i8]* @g3white, i32 1, i32 0), %getbit.exit256 ], [ %runetab.0.ph.be, %for.cond10.outer.backedge ]
  %runlen.0.ph = phi i32 [ 0, %getbit.exit256 ], [ %runlen.2, %for.cond10.outer.backedge ]
  %runcolor.0.ph = phi i32 [ 0, %getbit.exit256 ], [ %runcolor.0.ph.be, %for.cond10.outer.backedge ]
  %curcol.0.ph = phi i32 [ 0, %getbit.exit256 ], [ %curcol.2, %for.cond10.outer.backedge ]
  br label %for.cond10

for.cond10:                                       ; preds = %for.cond10.outer, %if.then
  %.b121355 = phi i1 [ %.b121354, %if.then ], [ %.b.pre, %for.cond10.outer ]
  %.pre.i233 = phi i32 [ %shr.i242, %if.then ], [ %.pre.i233333, %for.cond10.outer ]
  %30 = phi i32 [ %33, %if.then ], [ %29, %for.cond10.outer ]
  %.b = phi i1 [ %.b330, %if.then ], [ %.b.pre, %for.cond10.outer ]
  %code.0 = phi i32 [ %add17, %if.then ], [ %code.0.ph, %for.cond10.outer ]
  %runtab.0 = phi i8* [ %add.ptr, %if.then ], [ %runtab.0.ph, %for.cond10.outer ]
  br i1 %.b, label %for.end88.loopexit460, label %for.body13

for.body13:                                       ; preds = %for.cond10
  %conv14 = shl nsw i32 %code.0, 1
  %shl15 = and i32 %conv14, 510
  %dec.i231 = add nsw i32 %30, -1
  store i32 %dec.i231, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i232 = icmp slt i32 %30, 1
  br i1 %cmp.i232, label %if.then.i236, label %getbit.exit243

if.then.i236:                                     ; preds = %for.body13
  %31 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i235 = icmp ult i8* %31, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i235, label %if.else.i240, label %if.then2.i237

if.then2.i237:                                    ; preds = %if.then.i236
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  store i1 true, i1* @eof, align 1
  br label %getbit.exit243

if.else.i240:                                     ; preds = %if.then.i236
  %incdec.ptr.i238 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %incdec.ptr.i238, i8** @nextbyte, align 4, !tbaa !11
  %32 = load i8, i8* %31, align 1, !tbaa !1
  %conv.i239 = zext i8 %32 to i32
  store i32 %conv.i239, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit243

getbit.exit243:                                   ; preds = %for.body13, %if.then2.i237, %if.else.i240
  %.b121354 = phi i1 [ true, %if.then2.i237 ], [ %.b121355, %if.else.i240 ], [ %.b121355, %for.body13 ]
  %33 = phi i32 [ %dec.i231, %if.then2.i237 ], [ 7, %if.else.i240 ], [ %dec.i231, %for.body13 ]
  %.b330 = phi i1 [ true, %if.then2.i237 ], [ false, %if.else.i240 ], [ false, %for.body13 ]
  %34 = phi i32 [ 0, %if.then2.i237 ], [ %conv.i239, %if.else.i240 ], [ %.pre.i233, %for.body13 ]
  %and.i241 = and i32 %34, 1
  %shr.i242 = lshr i32 %34, 1
  store i32 %shr.i242, i32* @lastbyte, align 4, !tbaa !9
  %add17 = or i32 %and.i241, %shl15
  %idxprom = and i32 %add17, 255
  %arrayidx = getelementptr inbounds i8, i8* %runtab.0, i32 %idxprom
  %35 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %cmp = icmp eq i8 %35, 0
  br i1 %cmp, label %if.then, label %if.end29

if.then:                                          ; preds = %getbit.exit243
  %add.ptr = getelementptr inbounds i8, i8* %runtab.0, i32 256
  %cmp21 = icmp ult i8* %add.ptr, %runetab.0.ph
  br i1 %cmp21, label %for.cond10, label %if.end

if.end:                                           ; preds = %if.then
  %curcol.0.ph.lcssa513 = phi i32 [ %curcol.0.ph, %if.then ]
  %idxprom.lcssa508 = phi i32 [ %idxprom, %if.then ]
  %shr.i242.lcssa505 = phi i32 [ %shr.i242, %if.then ]
  %.lcssa503 = phi i32 [ %33, %if.then ]
  %.b121354.lcssa499 = phi i1 [ %.b121354, %if.then ]
  %cmp25 = icmp eq i32 %idxprom.lcssa508, 1
  br i1 %cmp25, label %if.then35, label %for.cond.outer.for.cond.outer.split_crit_edge.i198.preheader

for.cond.outer.for.cond.outer.split_crit_edge.i198.preheader: ; preds = %if.end
  br label %for.cond.outer.for.cond.outer.split_crit_edge.i198

select.unfold.i196.loopexit:                      ; preds = %getbit.exit.i214
  %shr.i.i212.lcssa = phi i32 [ %shr.i.i212, %getbit.exit.i214 ]
  %.pre29.i210.lcssa = phi i32 [ %.pre29.i210, %getbit.exit.i214 ]
  br label %select.unfold.i196

select.unfold.i196:                               ; preds = %select.unfold.i196.loopexit, %getbit.exit.thread.i206
  %.b121352 = phi i1 [ true, %getbit.exit.thread.i206 ], [ %.b121353, %select.unfold.i196.loopexit ]
  %.pre.i.i202342 = phi i32 [ 0, %getbit.exit.thread.i206 ], [ %shr.i.i212.lcssa, %select.unfold.i196.loopexit ]
  %36 = phi i32 [ %dec.i.i199.lcssa, %getbit.exit.thread.i206 ], [ %.pre29.i210.lcssa, %select.unfold.i196.loopexit ]
  %inc22.i194 = add nuw nsw i32 %n.0.ph26.i197, 1
  %exitcond319 = icmp eq i32 %inc22.i194, 11
  br i1 %exitcond319, label %while.cond.i217.outer.preheader, label %for.cond.outer.for.cond.outer.split_crit_edge.i198

while.cond.i217.outer.preheader:                  ; preds = %select.unfold.i196
  %.lcssa519 = phi i32 [ %36, %select.unfold.i196 ]
  %.pre.i.i202342.lcssa = phi i32 [ %.pre.i.i202342, %select.unfold.i196 ]
  %.b121352.lcssa = phi i1 [ %.b121352, %select.unfold.i196 ]
  br label %while.cond.i217.outer

for.cond.outer.for.cond.outer.split_crit_edge.i198: ; preds = %for.cond.outer.for.cond.outer.split_crit_edge.i198.preheader, %select.unfold.i196
  %.b121353 = phi i1 [ %.b121352, %select.unfold.i196 ], [ %.b121354.lcssa499, %for.cond.outer.for.cond.outer.split_crit_edge.i198.preheader ]
  %.pre.i.i202341 = phi i32 [ %.pre.i.i202342, %select.unfold.i196 ], [ %shr.i242.lcssa505, %for.cond.outer.for.cond.outer.split_crit_edge.i198.preheader ]
  %37 = phi i32 [ %36, %select.unfold.i196 ], [ %.lcssa503, %for.cond.outer.for.cond.outer.split_crit_edge.i198.preheader ]
  %n.0.ph26.i197 = phi i32 [ %inc22.i194, %select.unfold.i196 ], [ 0, %for.cond.outer.for.cond.outer.split_crit_edge.i198.preheader ]
  br label %for.body.i201

for.body.i201:                                    ; preds = %getbit.exit.i214, %for.cond.outer.for.cond.outer.split_crit_edge.i198
  %.pre.i.i202 = phi i32 [ %shr.i.i212, %getbit.exit.i214 ], [ %.pre.i.i202341, %for.cond.outer.for.cond.outer.split_crit_edge.i198 ]
  %38 = phi i32 [ %.pre29.i210, %getbit.exit.i214 ], [ %37, %for.cond.outer.for.cond.outer.split_crit_edge.i198 ]
  %dec.i.i199 = add nsw i32 %38, -1
  store i32 %dec.i.i199, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i.i200 = icmp slt i32 %38, 1
  br i1 %cmp.i.i200, label %if.then.i.i205, label %getbit.exit.i214

if.then.i.i205:                                   ; preds = %for.body.i201
  %39 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i.i204 = icmp ult i8* %39, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i.i204, label %if.else.i.i209, label %getbit.exit.thread.i206

getbit.exit.thread.i206:                          ; preds = %if.then.i.i205
  %dec.i.i199.lcssa = phi i32 [ %dec.i.i199, %if.then.i.i205 ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  br label %select.unfold.i196

if.else.i.i209:                                   ; preds = %if.then.i.i205
  %incdec.ptr.i.i207 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %incdec.ptr.i.i207, i8** @nextbyte, align 4, !tbaa !11
  %40 = load i8, i8* %39, align 1, !tbaa !1
  %conv.i.i208 = zext i8 %40 to i32
  store i32 %conv.i.i208, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit.i214

getbit.exit.i214:                                 ; preds = %for.body.i201, %if.else.i.i209
  %.pre29.i210 = phi i32 [ 7, %if.else.i.i209 ], [ %dec.i.i199, %for.body.i201 ]
  %41 = phi i32 [ %conv.i.i208, %if.else.i.i209 ], [ %.pre.i.i202, %for.body.i201 ]
  %and.i.i211 = and i32 %41, 1
  %shr.i.i212 = lshr i32 %41, 1
  store i32 %shr.i.i212, i32* @lastbyte, align 4, !tbaa !9
  %cmp1.i213 = icmp eq i32 %and.i.i211, 0
  br i1 %cmp1.i213, label %select.unfold.i196.loopexit, label %for.body.i201

while.cond.i217:                                  ; preds = %while.cond.i217.outer, %getbit.exit17.i229
  %.pre.i7.i218 = phi i32 [ %shr.i16.i227, %getbit.exit17.i229 ], [ %.pre.i7.i218.ph, %while.cond.i217.outer ]
  %42 = phi i32 [ %45, %getbit.exit17.i229 ], [ %.ph, %while.cond.i217.outer ]
  %dec.i5.i215 = add nsw i32 %42, -1
  store i32 %dec.i5.i215, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i6.i216 = icmp slt i32 %42, 1
  br i1 %cmp.i6.i216, label %if.then.i10.i221, label %getbit.exit17.i229

if.then.i10.i221:                                 ; preds = %while.cond.i217
  %43 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i9.i220 = icmp ult i8* %43, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i9.i220, label %if.else.i14.i225, label %getbit.exit17.thread.i222

getbit.exit17.thread.i222:                        ; preds = %if.then.i10.i221
  %dec.i5.i215.lcssa = phi i32 [ %dec.i5.i215, %if.then.i10.i221 ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  br label %while.cond.i217.outer

while.cond.i217.outer:                            ; preds = %while.cond.i217.outer.preheader, %getbit.exit17.thread.i222
  %.b121351.ph = phi i1 [ true, %getbit.exit17.thread.i222 ], [ %.b121352.lcssa, %while.cond.i217.outer.preheader ]
  %.pre.i7.i218.ph = phi i32 [ 0, %getbit.exit17.thread.i222 ], [ %.pre.i.i202342.lcssa, %while.cond.i217.outer.preheader ]
  %.ph = phi i32 [ %dec.i5.i215.lcssa, %getbit.exit17.thread.i222 ], [ %.lcssa519, %while.cond.i217.outer.preheader ]
  br label %while.cond.i217

if.else.i14.i225:                                 ; preds = %if.then.i10.i221
  %incdec.ptr.i12.i223 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %incdec.ptr.i12.i223, i8** @nextbyte, align 4, !tbaa !11
  %44 = load i8, i8* %43, align 1, !tbaa !1
  %conv.i13.i224 = zext i8 %44 to i32
  store i32 %conv.i13.i224, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit17.i229

getbit.exit17.i229:                               ; preds = %while.cond.i217, %if.else.i14.i225
  %45 = phi i32 [ 7, %if.else.i14.i225 ], [ %dec.i5.i215, %while.cond.i217 ]
  %46 = phi i32 [ %conv.i13.i224, %if.else.i14.i225 ], [ %.pre.i7.i218, %while.cond.i217 ]
  %and.i15.i226 = and i32 %46, 1
  %shr.i16.i227 = lshr i32 %46, 1
  store i32 %shr.i16.i227, i32* @lastbyte, align 4, !tbaa !9
  %cmp3.i228 = icmp eq i32 %and.i15.i226, 0
  br i1 %cmp3.i228, label %while.cond.i217, label %for.end88.loopexit

if.end29:                                         ; preds = %getbit.exit243
  %.lcssa509 = phi i8 [ %35, %getbit.exit243 ]
  %shr.i242.lcssa = phi i32 [ %shr.i242, %getbit.exit243 ]
  %.lcssa = phi i32 [ %33, %getbit.exit243 ]
  %.b121354.lcssa = phi i1 [ %.b121354, %getbit.exit243 ]
  %conv19.le = zext i8 %.lcssa509 to i32
  %dec = add nsw i32 %conv19.le, -1
  %cmp30 = icmp sgt i32 %dec, 63
  br i1 %cmp30, label %if.then32, label %if.else46

if.then32:                                        ; preds = %if.end29
  %cmp33 = icmp sgt i32 %dec, 253
  br i1 %cmp33, label %if.then35.loopexit, label %if.end44

if.then35.loopexit:                               ; preds = %if.then32
  %curcol.0.ph.lcssa512 = phi i32 [ %curcol.0.ph, %if.then32 ]
  %.b121354.lcssa.lcssa502 = phi i1 [ %.b121354.lcssa, %if.then32 ]
  br label %if.then35

if.then35:                                        ; preds = %if.then35.loopexit, %if.end
  %curcol.0.ph514 = phi i32 [ %curcol.0.ph.lcssa512, %if.then35.loopexit ], [ %curcol.0.ph.lcssa513, %if.end ]
  %.b121354500 = phi i1 [ %.b121354.lcssa.lcssa502, %if.then35.loopexit ], [ %.b121354.lcssa499, %if.end ]
  %cmp36 = icmp eq i32 %curcol.0.ph514, 0
  br i1 %cmp36, label %if.else, label %for.end88

if.else:                                          ; preds = %if.then35
  %inc = add nsw i32 %15, 1
  %cmp39 = icmp sgt i32 %15, 1
  br i1 %cmp39, label %if.then41, label %for.end88

if.then41:                                        ; preds = %if.else
  store i1 true, i1* @eof, align 1
  br label %for.end88

if.end44:                                         ; preds = %if.then32
  %sub = shl nuw nsw i32 %conv19.le, 6
  %mul = add i32 %runlen.0.ph, -4160
  %add45 = add i32 %mul, %sub
  br label %if.end68

if.else46:                                        ; preds = %if.end29
  %add47 = add nsw i32 %dec, %runlen.0.ph
  %add48 = add nsw i32 %add47, %curcol.0.ph
  %cmp49 = icmp sgt i32 %add48, 1728
  %sub52 = sub nsw i32 1728, %curcol.0.ph
  %sub52.add47 = select i1 %cmp49, i32 %sub52, i32 %add47
  %cmp56303 = icmp sgt i32 %sub52.add47, 0
  br i1 %cmp56303, label %for.body58.lr.ph, label %for.end

for.body58.lr.ph:                                 ; preds = %if.else46
  %conv59 = trunc i32 %runcolor.0.ph to i8
  %47 = sub i32 0, %runlen.0.ph
  %48 = sub i32 %47, %curcol.0.ph
  %49 = sub i32 %48, %conv19.le
  %50 = icmp sgt i32 %49, -1729
  %smax = select i1 %50, i32 %49, i32 -1729
  %51 = add i32 %curcol.0.ph, %smax
  %52 = icmp sgt i32 %51, -2
  %.op = add i32 %51, 1
  %53 = select i1 %52, i32 %.op, i32 -1
  %scevgep = getelementptr [1728 x i8], [1728 x i8]* @rowbuf, i32 0, i32 %curcol.0.ph
  %54 = sub i32 %53, %curcol.0.ph
  %55 = sub i32 %54, %smax
  call void @llvm.memset.p0i8.i32(i8* %scevgep, i8 %conv59, i32 %55, i32 1, i1 false)
  %56 = sub i32 %53, %smax
  br label %for.end

for.end:                                          ; preds = %for.body58.lr.ph, %if.else46
  %curcol.1.lcssa = phi i32 [ %56, %for.body58.lr.ph ], [ %curcol.0.ph, %if.else46 ]
  %cmp62 = icmp sgt i32 %curcol.1.lcssa, 1727
  br i1 %cmp62, label %for.cond.outer.for.cond.outer.split_crit_edge.i160.preheader, label %if.end65

for.cond.outer.for.cond.outer.split_crit_edge.i160.preheader: ; preds = %for.end
  %shr.i242.lcssa.lcssa = phi i32 [ %shr.i242.lcssa, %for.end ]
  %.lcssa.lcssa = phi i32 [ %.lcssa, %for.end ]
  %.b121354.lcssa.lcssa = phi i1 [ %.b121354.lcssa, %for.end ]
  br label %for.cond.outer.for.cond.outer.split_crit_edge.i160

select.unfold.i158.loopexit:                      ; preds = %getbit.exit.i176
  %shr.i.i174.lcssa = phi i32 [ %shr.i.i174, %getbit.exit.i176 ]
  %.pre29.i172.lcssa = phi i32 [ %.pre29.i172, %getbit.exit.i176 ]
  br label %select.unfold.i158

select.unfold.i158:                               ; preds = %select.unfold.i158.loopexit, %getbit.exit.thread.i168
  %.b121348 = phi i1 [ true, %getbit.exit.thread.i168 ], [ %.b121349, %select.unfold.i158.loopexit ]
  %.pre.i.i164337 = phi i32 [ 0, %getbit.exit.thread.i168 ], [ %shr.i.i174.lcssa, %select.unfold.i158.loopexit ]
  %57 = phi i32 [ %dec.i.i161.lcssa, %getbit.exit.thread.i168 ], [ %.pre29.i172.lcssa, %select.unfold.i158.loopexit ]
  %inc22.i156 = add nuw nsw i32 %n.0.ph26.i159, 1
  %exitcond = icmp eq i32 %inc22.i156, 11
  br i1 %exitcond, label %while.cond.i179.outer.preheader, label %for.cond.outer.for.cond.outer.split_crit_edge.i160

while.cond.i179.outer.preheader:                  ; preds = %select.unfold.i158
  %.lcssa516 = phi i32 [ %57, %select.unfold.i158 ]
  %.pre.i.i164337.lcssa = phi i32 [ %.pre.i.i164337, %select.unfold.i158 ]
  %.b121348.lcssa = phi i1 [ %.b121348, %select.unfold.i158 ]
  br label %while.cond.i179.outer

for.cond.outer.for.cond.outer.split_crit_edge.i160: ; preds = %for.cond.outer.for.cond.outer.split_crit_edge.i160.preheader, %select.unfold.i158
  %.b121349 = phi i1 [ %.b121348, %select.unfold.i158 ], [ %.b121354.lcssa.lcssa, %for.cond.outer.for.cond.outer.split_crit_edge.i160.preheader ]
  %.pre.i.i164336 = phi i32 [ %.pre.i.i164337, %select.unfold.i158 ], [ %shr.i242.lcssa.lcssa, %for.cond.outer.for.cond.outer.split_crit_edge.i160.preheader ]
  %58 = phi i32 [ %57, %select.unfold.i158 ], [ %.lcssa.lcssa, %for.cond.outer.for.cond.outer.split_crit_edge.i160.preheader ]
  %n.0.ph26.i159 = phi i32 [ %inc22.i156, %select.unfold.i158 ], [ 0, %for.cond.outer.for.cond.outer.split_crit_edge.i160.preheader ]
  br label %for.body.i163

for.body.i163:                                    ; preds = %getbit.exit.i176, %for.cond.outer.for.cond.outer.split_crit_edge.i160
  %.pre.i.i164 = phi i32 [ %shr.i.i174, %getbit.exit.i176 ], [ %.pre.i.i164336, %for.cond.outer.for.cond.outer.split_crit_edge.i160 ]
  %59 = phi i32 [ %.pre29.i172, %getbit.exit.i176 ], [ %58, %for.cond.outer.for.cond.outer.split_crit_edge.i160 ]
  %dec.i.i161 = add nsw i32 %59, -1
  store i32 %dec.i.i161, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i.i162 = icmp slt i32 %59, 1
  br i1 %cmp.i.i162, label %if.then.i.i167, label %getbit.exit.i176

if.then.i.i167:                                   ; preds = %for.body.i163
  %60 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i.i166 = icmp ult i8* %60, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i.i166, label %if.else.i.i171, label %getbit.exit.thread.i168

getbit.exit.thread.i168:                          ; preds = %if.then.i.i167
  %dec.i.i161.lcssa = phi i32 [ %dec.i.i161, %if.then.i.i167 ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  br label %select.unfold.i158

if.else.i.i171:                                   ; preds = %if.then.i.i167
  %incdec.ptr.i.i169 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %incdec.ptr.i.i169, i8** @nextbyte, align 4, !tbaa !11
  %61 = load i8, i8* %60, align 1, !tbaa !1
  %conv.i.i170 = zext i8 %61 to i32
  store i32 %conv.i.i170, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit.i176

getbit.exit.i176:                                 ; preds = %for.body.i163, %if.else.i.i171
  %.pre29.i172 = phi i32 [ 7, %if.else.i.i171 ], [ %dec.i.i161, %for.body.i163 ]
  %62 = phi i32 [ %conv.i.i170, %if.else.i.i171 ], [ %.pre.i.i164, %for.body.i163 ]
  %and.i.i173 = and i32 %62, 1
  %shr.i.i174 = lshr i32 %62, 1
  store i32 %shr.i.i174, i32* @lastbyte, align 4, !tbaa !9
  %cmp1.i175 = icmp eq i32 %and.i.i173, 0
  br i1 %cmp1.i175, label %select.unfold.i158.loopexit, label %for.body.i163

while.cond.i179:                                  ; preds = %while.cond.i179.outer, %getbit.exit17.i191
  %.pre.i7.i180 = phi i32 [ %shr.i16.i189, %getbit.exit17.i191 ], [ %.pre.i7.i180.ph, %while.cond.i179.outer ]
  %63 = phi i32 [ %66, %getbit.exit17.i191 ], [ %.ph363, %while.cond.i179.outer ]
  %dec.i5.i177 = add nsw i32 %63, -1
  store i32 %dec.i5.i177, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i6.i178 = icmp slt i32 %63, 1
  br i1 %cmp.i6.i178, label %if.then.i10.i183, label %getbit.exit17.i191

if.then.i10.i183:                                 ; preds = %while.cond.i179
  %64 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i9.i182 = icmp ult i8* %64, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i9.i182, label %if.else.i14.i187, label %getbit.exit17.thread.i184

getbit.exit17.thread.i184:                        ; preds = %if.then.i10.i183
  %dec.i5.i177.lcssa = phi i32 [ %dec.i5.i177, %if.then.i10.i183 ]
  store i1 true, i1* @eof, align 1
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  br label %while.cond.i179.outer

while.cond.i179.outer:                            ; preds = %while.cond.i179.outer.preheader, %getbit.exit17.thread.i184
  %.b121347.ph = phi i1 [ true, %getbit.exit17.thread.i184 ], [ %.b121348.lcssa, %while.cond.i179.outer.preheader ]
  %.pre.i7.i180.ph = phi i32 [ 0, %getbit.exit17.thread.i184 ], [ %.pre.i.i164337.lcssa, %while.cond.i179.outer.preheader ]
  %.ph363 = phi i32 [ %dec.i5.i177.lcssa, %getbit.exit17.thread.i184 ], [ %.lcssa516, %while.cond.i179.outer.preheader ]
  br label %while.cond.i179

if.else.i14.i187:                                 ; preds = %if.then.i10.i183
  %incdec.ptr.i12.i185 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %incdec.ptr.i12.i185, i8** @nextbyte, align 4, !tbaa !11
  %65 = load i8, i8* %64, align 1, !tbaa !1
  %conv.i13.i186 = zext i8 %65 to i32
  store i32 %conv.i13.i186, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit17.i191

getbit.exit17.i191:                               ; preds = %while.cond.i179, %if.else.i14.i187
  %66 = phi i32 [ 7, %if.else.i14.i187 ], [ %dec.i5.i177, %while.cond.i179 ]
  %67 = phi i32 [ %conv.i13.i186, %if.else.i14.i187 ], [ %.pre.i7.i180, %while.cond.i179 ]
  %and.i15.i188 = and i32 %67, 1
  %shr.i16.i189 = lshr i32 %67, 1
  store i32 %shr.i16.i189, i32* @lastbyte, align 4, !tbaa !9
  %cmp3.i190 = icmp eq i32 %and.i15.i188, 0
  br i1 %cmp3.i190, label %while.cond.i179, label %for.end88.loopexit459

if.end65:                                         ; preds = %for.end
  %cmp66 = icmp eq i32 %runcolor.0.ph, 0
  %cond = zext i1 %cmp66 to i32
  br label %if.end68

if.end68:                                         ; preds = %if.end65, %if.end44
  %shr.i242506 = phi i32 [ %shr.i242.lcssa, %if.end44 ], [ %shr.i242.lcssa, %if.end65 ]
  %68 = phi i32 [ %.lcssa, %if.end44 ], [ %.lcssa, %if.end65 ]
  %.b121354501 = phi i1 [ %.b121354.lcssa, %if.end44 ], [ %.b121354.lcssa, %if.end65 ]
  %runlen.2 = phi i32 [ %add45, %if.end44 ], [ 0, %if.end65 ]
  %runcolor.1 = phi i32 [ %runcolor.0.ph, %if.end44 ], [ %cond, %if.end65 ]
  %curcol.2 = phi i32 [ %curcol.0.ph, %if.end44 ], [ %curcol.1.lcssa, %if.end65 ]
  %cmp69 = icmp eq i32 %runcolor.1, 1
  %dec.i142 = add nsw i32 %68, -1
  store i32 %dec.i142, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i143 = icmp slt i32 %.lcssa, 1
  br i1 %cmp.i143, label %if.then.i147, label %getbit.exit154

if.then.i147:                                     ; preds = %if.end68
  %69 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i146 = icmp ult i8* %69, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i146, label %if.else.i151, label %if.then2.i148

if.then2.i148:                                    ; preds = %if.then.i147
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  store i1 true, i1* @eof, align 1
  br label %getbit.exit154

if.else.i151:                                     ; preds = %if.then.i147
  %incdec.ptr.i149 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %incdec.ptr.i149, i8** @nextbyte, align 4, !tbaa !11
  %70 = load i8, i8* %69, align 1, !tbaa !1
  %conv.i150 = zext i8 %70 to i32
  store i32 %conv.i150, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit154

getbit.exit154:                                   ; preds = %if.end68, %if.then2.i148, %if.else.i151
  %.b.pre359 = phi i1 [ true, %if.then2.i148 ], [ %.b121354501, %if.else.i151 ], [ %.b121354501, %if.end68 ]
  %71 = phi i32 [ %dec.i142, %if.then2.i148 ], [ 7, %if.else.i151 ], [ %dec.i142, %if.end68 ]
  %72 = phi i32 [ 0, %if.then2.i148 ], [ %conv.i150, %if.else.i151 ], [ %shr.i242506, %if.end68 ]
  %and.i152 = and i32 %72, 1
  %shr.i153 = lshr i32 %72, 1
  store i32 %shr.i153, i32* @lastbyte, align 4, !tbaa !9
  br i1 %cmp69, label %for.cond10.outer.backedge, label %if.else74

if.else74:                                        ; preds = %getbit.exit154
  %conv77 = shl nuw nsw i32 %and.i152, 1
  %dec.i129 = add nsw i32 %71, -1
  store i32 %dec.i129, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i130 = icmp slt i32 %71, 1
  br i1 %cmp.i130, label %if.then.i134, label %getbit.exit141

if.then.i134:                                     ; preds = %if.else74
  %73 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i133 = icmp ult i8* %73, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i133, label %if.else.i138, label %if.then2.i135

if.then2.i135:                                    ; preds = %if.then.i134
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  store i1 true, i1* @eof, align 1
  br label %getbit.exit141

if.else.i138:                                     ; preds = %if.then.i134
  %incdec.ptr.i136 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %incdec.ptr.i136, i8** @nextbyte, align 4, !tbaa !11
  %74 = load i8, i8* %73, align 1, !tbaa !1
  %conv.i137 = zext i8 %74 to i32
  store i32 %conv.i137, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit141

getbit.exit141:                                   ; preds = %if.else74, %if.then2.i135, %if.else.i138
  %.b.pre358 = phi i1 [ true, %if.then2.i135 ], [ %.b.pre359, %if.else.i138 ], [ %.b.pre359, %if.else74 ]
  %75 = phi i32 [ %dec.i129, %if.then2.i135 ], [ 7, %if.else.i138 ], [ %dec.i129, %if.else74 ]
  %76 = phi i32 [ 0, %if.then2.i135 ], [ %conv.i137, %if.else.i138 ], [ %shr.i153, %if.else74 ]
  %and.i139 = and i32 %76, 1
  %shr.i140 = lshr i32 %76, 1
  store i32 %shr.i140, i32* @lastbyte, align 4, !tbaa !9
  %add80 = or i32 %and.i139, %conv77
  %conv82 = shl nuw nsw i32 %add80, 1
  %shl83 = and i32 %conv82, 6
  %dec.i = add nsw i32 %75, -1
  store i32 %dec.i, i32* @bitsleft, align 4, !tbaa !9
  %cmp.i125 = icmp slt i32 %75, 1
  br i1 %cmp.i125, label %if.then.i, label %getbit.exit

if.then.i:                                        ; preds = %getbit.exit141
  %77 = load i8*, i8** @nextbyte, align 4, !tbaa !11
  %cmp1.i126 = icmp ult i8* %77, getelementptr inbounds ([1792 x i8], [1792 x i8]* @fax, i32 1, i32 0)
  br i1 %cmp1.i126, label %if.else.i, label %if.then2.i

if.then2.i:                                       ; preds = %if.then.i
  store i32 0, i32* @lastbyte, align 4, !tbaa !9
  store i1 true, i1* @eof, align 1
  br label %getbit.exit

if.else.i:                                        ; preds = %if.then.i
  %incdec.ptr.i127 = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %incdec.ptr.i127, i8** @nextbyte, align 4, !tbaa !11
  %78 = load i8, i8* %77, align 1, !tbaa !1
  %conv.i128 = zext i8 %78 to i32
  store i32 %conv.i128, i32* @lastbyte, align 4, !tbaa !9
  store i32 7, i32* @bitsleft, align 4, !tbaa !9
  br label %getbit.exit

getbit.exit:                                      ; preds = %getbit.exit141, %if.then2.i, %if.else.i
  %.b.pre357 = phi i1 [ true, %if.then2.i ], [ %.b.pre358, %if.else.i ], [ %.b.pre358, %getbit.exit141 ]
  %79 = phi i32 [ %dec.i, %if.then2.i ], [ 7, %if.else.i ], [ %dec.i, %getbit.exit141 ]
  %80 = phi i32 [ 0, %if.then2.i ], [ %conv.i128, %if.else.i ], [ %shr.i140, %getbit.exit141 ]
  %and.i = and i32 %80, 1
  %shr.i = lshr i32 %80, 1
  store i32 %shr.i, i32* @lastbyte, align 4, !tbaa !9
  %add85 = or i32 %and.i, %shl83
  br label %for.cond10.outer.backedge

for.cond10.outer.backedge:                        ; preds = %getbit.exit, %getbit.exit154
  %.b.pre.be = phi i1 [ %.b.pre359, %getbit.exit154 ], [ %.b.pre357, %getbit.exit ]
  %.pre.i233333.be = phi i32 [ %shr.i153, %getbit.exit154 ], [ %shr.i, %getbit.exit ]
  %.be = phi i32 [ %71, %getbit.exit154 ], [ %79, %getbit.exit ]
  %code.0.ph.be = phi i32 [ %and.i152, %getbit.exit154 ], [ %add85, %getbit.exit ]
  %runtab.0.ph.be = phi i8* [ getelementptr inbounds ([3072 x i8], [3072 x i8]* @g3black, i32 0, i32 0), %getbit.exit154 ], [ getelementptr inbounds ([2304 x i8], [2304 x i8]* @g3white, i32 0, i32 0), %getbit.exit ]
  %runetab.0.ph.be = phi i8* [ getelementptr inbounds ([3072 x i8], [3072 x i8]* @g3black, i32 1, i32 0), %getbit.exit154 ], [ getelementptr inbounds ([2304 x i8], [2304 x i8]* @g3white, i32 1, i32 0), %getbit.exit ]
  %runcolor.0.ph.be = phi i32 [ 1, %getbit.exit154 ], [ %runcolor.1, %getbit.exit ]
  br label %for.cond10.outer

for.end88.loopexit:                               ; preds = %getbit.exit17.i229
  %.b121351.ph.lcssa = phi i1 [ %.b121351.ph, %getbit.exit17.i229 ]
  br label %for.end88

for.end88.loopexit459:                            ; preds = %getbit.exit17.i191
  %.b121347.ph.lcssa = phi i1 [ %.b121347.ph, %getbit.exit17.i191 ]
  br label %for.end88

for.end88.loopexit460:                            ; preds = %for.cond10
  %.b121355.lcssa = phi i1 [ %.b121355, %for.cond10 ]
  br label %for.end88

for.end88:                                        ; preds = %for.end88.loopexit460, %for.end88.loopexit459, %for.end88.loopexit, %if.then35, %if.then41, %if.else
  %.b121 = phi i1 [ true, %if.then41 ], [ %.b121354500, %if.else ], [ %.b121354500, %if.then35 ], [ %.b121351.ph.lcssa, %for.end88.loopexit ], [ %.b121347.ph.lcssa, %for.end88.loopexit459 ], [ %.b121355.lcssa, %for.end88.loopexit460 ]
  %81 = phi i32 [ %inc, %if.then41 ], [ %inc, %if.else ], [ 0, %if.then35 ], [ %15, %for.end88.loopexit ], [ %15, %for.end88.loopexit459 ], [ %15, %for.end88.loopexit460 ]
  %82 = load i32, i32* @sum, align 4, !tbaa !9
  %83 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %82, i32 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.end88
  %index = phi i32 [ 0, %for.end88 ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %83, %for.end88 ], [ %89, %vector.body ]
  %vec.phi433 = phi <4 x i32> [ zeroinitializer, %for.end88 ], [ %90, %vector.body ]
  %next.gep = getelementptr [1728 x i8], [1728 x i8]* @rowbuf, i32 0, i32 %index
  %84 = bitcast i8* %next.gep to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %84, align 1, !tbaa !1
  %next.gep.sum454 = or i32 %index, 4
  %85 = getelementptr [1728 x i8], [1728 x i8]* @rowbuf, i32 0, i32 %next.gep.sum454
  %86 = bitcast i8* %85 to <4 x i8>*
  %wide.load449 = load <4 x i8>, <4 x i8>* %86, align 1, !tbaa !1
  %87 = zext <4 x i8> %wide.load to <4 x i32>
  %88 = zext <4 x i8> %wide.load449 to <4 x i32>
  %89 = add <4 x i32> %87, %vec.phi
  %90 = add <4 x i32> %88, %vec.phi433
  %index.next = add i32 %index, 8
  %91 = icmp eq i32 %index.next, 1728
  br i1 %91, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  %.lcssa522 = phi <4 x i32> [ %90, %vector.body ]
  %.lcssa521 = phi <4 x i32> [ %89, %vector.body ]
  %bin.rdx = add <4 x i32> %.lcssa522, %.lcssa521
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx451 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf452 = shufflevector <4 x i32> %bin.rdx451, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx453 = add <4 x i32> %bin.rdx451, %rdx.shuf452
  %92 = extractelement <4 x i32> %bin.rdx453, i32 0
  store i32 %92, i32* @sum, align 4, !tbaa !9
  br i1 %.b121, label %for.end91, label %for.body

for.end91:                                        ; preds = %middle.block
  %.lcssa523 = phi i32 [ %92, %middle.block ]
  %phitmp = icmp eq i32 %.lcssa523, 11296
  br i1 %phitmp, label %if.else96, label %if.then94

if.then94:                                        ; preds = %for.cond.preheader, %for.end91
  %puts122 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str3, i32 0, i32 0))
  br label %return

if.else96:                                        ; preds = %for.end91
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %if.else96, %if.then94
  %retval.0 = phi i32 [ 15, %if.then94 ], [ 66, %if.else96 ]
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
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !2, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !2, i64 0}
!13 = distinct !{!13, !5, !6}
!14 = distinct !{!14, !8, !5, !6}
!15 = distinct !{!15, !5, !6}
