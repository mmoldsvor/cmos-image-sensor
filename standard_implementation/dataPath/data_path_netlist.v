/* Generated by Yosys 0.9 (git sha1 1979e0b1, gcc 10.3.0-1ubuntu1~20.10 -fPIC -Os) */

(* dynports =  1  *)
(* top =  1  *)
(* src = "data_path.sv:3" *)
module data_path(clk, reset, enable, cont_mode, cds, erase, corr, expose, convert, read, idle, pixel_select);
  (* src = "data_path.sv:38" *)
  wire _000_;
  (* src = "data_path.sv:38" *)
  wire _001_;
  (* src = "data_path.sv:28" *)
  wire [15:0] _002_;
  (* src = "data_path.sv:38" *)
  wire _003_;
  (* src = "data_path.sv:38" *)
  wire _004_;
  (* src = "data_path.sv:38" *)
  wire _005_;
  wire [2:0] _006_;
  (* src = "data_path.sv:38" *)
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  (* src = "data_path.sv:38" *)
  wire _105_;
  (* src = "data_path.sv:38" *)
  wire _106_;
  (* src = "data_path.sv:28" *)
  wire _107_;
  (* src = "data_path.sv:28" *)
  wire _108_;
  (* src = "data_path.sv:28" *)
  wire _109_;
  (* src = "data_path.sv:28" *)
  wire _110_;
  (* src = "data_path.sv:28" *)
  wire _111_;
  (* src = "data_path.sv:28" *)
  wire _112_;
  (* src = "data_path.sv:28" *)
  wire _113_;
  (* src = "data_path.sv:28" *)
  wire _114_;
  (* src = "data_path.sv:28" *)
  wire _115_;
  (* src = "data_path.sv:28" *)
  wire _116_;
  (* src = "data_path.sv:28" *)
  wire _117_;
  (* src = "data_path.sv:28" *)
  wire _118_;
  (* src = "data_path.sv:28" *)
  wire _119_;
  (* src = "data_path.sv:28" *)
  wire _120_;
  (* src = "data_path.sv:28" *)
  wire _121_;
  (* src = "data_path.sv:28" *)
  wire _122_;
  (* src = "data_path.sv:38" *)
  wire _123_;
  (* src = "data_path.sv:38" *)
  wire _124_;
  (* src = "data_path.sv:38" *)
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  (* src = "data_path.sv:38" *)
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  (* src = "data_path.sv:7" *)
  wire _133_;
  (* src = "data_path.sv:6" *)
  wire _134_;
  (* src = "data_path.sv:9" *)
  wire _135_;
  (* src = "data_path.sv:26" *)
  wire _136_;
  (* src = "data_path.sv:26" *)
  wire _137_;
  (* src = "data_path.sv:26" *)
  wire _138_;
  (* src = "data_path.sv:26" *)
  wire _139_;
  (* src = "data_path.sv:26" *)
  wire _140_;
  (* src = "data_path.sv:26" *)
  wire _141_;
  (* src = "data_path.sv:26" *)
  wire _142_;
  (* src = "data_path.sv:26" *)
  wire _143_;
  (* src = "data_path.sv:26" *)
  wire _144_;
  (* src = "data_path.sv:26" *)
  wire _145_;
  (* src = "data_path.sv:26" *)
  wire _146_;
  (* src = "data_path.sv:26" *)
  wire _147_;
  (* src = "data_path.sv:26" *)
  wire _148_;
  (* src = "data_path.sv:26" *)
  wire _149_;
  (* src = "data_path.sv:26" *)
  wire _150_;
  (* src = "data_path.sv:26" *)
  wire _151_;
  (* src = "data_path.sv:5" *)
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  wire _196_;
  wire _197_;
  wire _198_;
  wire _199_;
  wire _200_;
  wire _201_;
  wire _202_;
  wire _203_;
  wire _204_;
  wire _205_;
  wire _206_;
  wire _207_;
  wire _208_;
  wire _209_;
  wire _210_;
  wire _211_;
  wire _212_;
  wire _213_;
  wire _214_;
  wire _215_;
  wire _216_;
  wire _217_;
  wire _218_;
  wire _219_;
  wire _220_;
  wire _221_;
  wire _222_;
  wire _223_;
  wire _224_;
  wire _225_;
  wire _226_;
  wire _227_;
  wire _228_;
  wire _229_;
  wire _230_;
  wire _231_;
  wire _232_;
  wire _233_;
  wire _234_;
  wire _235_;
  wire _236_;
  wire _237_;
  wire _238_;
  wire _239_;
  wire _240_;
  wire _241_;
  wire _242_;
  wire _243_;
  wire _244_;
  wire _245_;
  wire _246_;
  wire _247_;
  wire _248_;
  wire _249_;
  wire _250_;
  (* src = "data_path.sv:25" *)
  wire _251_;
  (* src = "data_path.sv:25" *)
  wire _252_;
  (* src = "data_path.sv:25" *)
  wire _253_;
  (* src = "data_path.sv:25" *)
  wire _254_;
  (* src = "data_path.sv:14" *)
  wire _255_;
  (* src = "data_path.sv:14" *)
  wire _256_;
  (* src = "data_path.sv:24" *)
  wire _257_;
  (* src = "data_path.sv:24" *)
  wire _258_;
  (* src = "data_path.sv:24" *)
  wire _259_;
  (* src = "data_path.sv:24" *)
  wire _260_;
  wire _261_;
  wire _262_;
  wire _263_;
  wire _264_;
  wire _265_;
  wire _266_;
  wire _267_;
  wire _268_;
  wire _269_;
  wire _270_;
  wire _271_;
  wire _272_;
  wire _273_;
  wire _274_;
  wire _275_;
  wire _276_;
  wire _277_;
  wire _278_;
  wire _279_;
  wire _280_;
  (* src = "data_path.sv:7" *)
  input cds;
  (* src = "data_path.sv:3" *)
  input clk;
  (* src = "data_path.sv:6" *)
  input cont_mode;
  (* src = "data_path.sv:11" *)
  output convert;
  (* src = "data_path.sv:9" *)
  output corr;
  (* init = 16'h0000 *)
  (* src = "data_path.sv:26" *)
  wire [15:0] counter;
  (* src = "data_path.sv:5" *)
  input enable;
  (* src = "data_path.sv:8" *)
  output erase;
  (* src = "data_path.sv:10" *)
  output expose;
  (* src = "data_path.sv:13" *)
  output idle;
  (* src = "data_path.sv:25" *)
  wire [3:0] next_state;
  (* src = "data_path.sv:14" *)
  output [1:0] pixel_select;
  (* src = "data_path.sv:12" *)
  output read;
  (* src = "data_path.sv:4" *)
  input reset;
  (* src = "data_path.sv:24" *)
  wire [3:0] state;
  IVX1_CV _281_ (
    .A(_257_),
    .Y(_218_)
  );
  IVX1_CV _282_ (
    .A(_136_),
    .Y(_219_)
  );
  IVX1_CV _283_ (
    .A(_149_),
    .Y(_220_)
  );
  IVX1_CV _284_ (
    .A(_135_),
    .Y(_221_)
  );
  NRX1_CV _285_ (
    .A(_259_),
    .B(_260_),
    .Y(_222_)
  );
  NDX1_CV _286_ (
    .A(_257_),
    .B(_222_),
    .Y(_223_)
  );
  NRX1_CV _287_ (
    .A(_258_),
    .B(_223_),
    .Y(_123_)
  );
  NDX1_CV _288_ (
    .A(_258_),
    .B(_257_),
    .Y(_224_)
  );
  ANX1_CV _289_ (
    .A(_258_),
    .B(_222_),
    .Y(_225_)
  );
  ANX1_CV _290_ (
    .A(_257_),
    .B(_225_),
    .Y(_105_)
  );
  NDX1_CV _291_ (
    .A(_218_),
    .B(_222_),
    .Y(_226_)
  );
  ANX1_CV _292_ (
    .A(_218_),
    .B(_225_),
    .Y(_124_)
  );
  NRX1_CV _293_ (
    .A(_258_),
    .B(_257_),
    .Y(_227_)
  );
  ORX1_CV _294_ (
    .A(_258_),
    .B(_257_),
    .Y(_228_)
  );
  NDX1_CV _295_ (
    .A(_259_),
    .B(_227_),
    .Y(_229_)
  );
  NRX1_CV _296_ (
    .A(_260_),
    .B(_229_),
    .Y(_129_)
  );
  ANX1_CV _297_ (
    .A(_136_),
    .B(_129_),
    .Y(_255_)
  );
  ANX1_CV _298_ (
    .A(_143_),
    .B(_129_),
    .Y(_256_)
  );
  ANX1_CV _299_ (
    .A(_222_),
    .B(_228_),
    .Y(_230_)
  );
  NRX1_CV _300_ (
    .A(_129_),
    .B(_230_),
    .Y(_125_)
  );
  NRX1_CV _301_ (
    .A(_140_),
    .B(_139_),
    .Y(_231_)
  );
  NRX1_CV _302_ (
    .A(_142_),
    .B(_141_),
    .Y(_232_)
  );
  ANX1_CV _303_ (
    .A(_231_),
    .B(_232_),
    .Y(_233_)
  );
  NRX1_CV _304_ (
    .A(_151_),
    .B(_150_),
    .Y(_234_)
  );
  NRX1_CV _305_ (
    .A(_138_),
    .B(_137_),
    .Y(_235_)
  );
  ANX1_CV _306_ (
    .A(_234_),
    .B(_235_),
    .Y(_236_)
  );
  NDX1_CV _307_ (
    .A(_233_),
    .B(_236_),
    .Y(_237_)
  );
  NRX1_CV _308_ (
    .A(_145_),
    .B(_237_),
    .Y(_238_)
  );
  NRX1_CV _309_ (
    .A(_147_),
    .B(_146_),
    .Y(_239_)
  );
  NRX1_CV _310_ (
    .A(_149_),
    .B(_148_),
    .Y(_240_)
  );
  ANX1_CV _311_ (
    .A(_239_),
    .B(_240_),
    .Y(_241_)
  );
  NRX1_CV _312_ (
    .A(_136_),
    .B(_143_),
    .Y(_242_)
  );
  ANX1_CV _313_ (
    .A(_144_),
    .B(_242_),
    .Y(_243_)
  );
  ANX1_CV _314_ (
    .A(_241_),
    .B(_243_),
    .Y(_244_)
  );
  ANX1_CV _315_ (
    .A(_238_),
    .B(_244_),
    .Y(_245_)
  );
  NDX1_CV _316_ (
    .A(_238_),
    .B(_244_),
    .Y(_246_)
  );
  ANX1_CV _317_ (
    .A(_133_),
    .B(_123_),
    .Y(_247_)
  );
  ANX1_CV _318_ (
    .A(_245_),
    .B(_247_),
    .Y(_106_)
  );
  ENX1_CV _319_ (
    .A(_258_),
    .B(_252_),
    .Y(_248_)
  );
  ENX1_CV _320_ (
    .A(_257_),
    .B(_251_),
    .Y(_249_)
  );
  ANX1_CV _321_ (
    .A(_248_),
    .B(_249_),
    .Y(_250_)
  );
  ENX1_CV _322_ (
    .A(_260_),
    .B(_254_),
    .Y(_153_)
  );
  ENX1_CV _323_ (
    .A(_259_),
    .B(_253_),
    .Y(_154_)
  );
  ANX1_CV _324_ (
    .A(_153_),
    .B(_154_),
    .Y(_155_)
  );
  ANX1_CV _325_ (
    .A(_250_),
    .B(_155_),
    .Y(_156_)
  );
  IVX1_CV _326_ (
    .A(_156_),
    .Y(_157_)
  );
  ANX1_CV _327_ (
    .A(_219_),
    .B(_156_),
    .Y(_107_)
  );
  ANX1_CV _328_ (
    .A(_136_),
    .B(_143_),
    .Y(_158_)
  );
  EOX1_CV _329_ (
    .A(_136_),
    .B(_143_),
    .Y(_159_)
  );
  ANX1_CV _330_ (
    .A(_156_),
    .B(_159_),
    .Y(_114_)
  );
  NDX1_CV _331_ (
    .A(_144_),
    .B(_158_),
    .Y(_160_)
  );
  EOX1_CV _332_ (
    .A(_144_),
    .B(_158_),
    .Y(_161_)
  );
  ANX1_CV _333_ (
    .A(_156_),
    .B(_161_),
    .Y(_115_)
  );
  ANX1_CV _334_ (
    .A(_145_),
    .B(_144_),
    .Y(_162_)
  );
  ANX1_CV _335_ (
    .A(_158_),
    .B(_162_),
    .Y(_163_)
  );
  ENX1_CV _336_ (
    .A(_145_),
    .B(_160_),
    .Y(_164_)
  );
  ANX1_CV _337_ (
    .A(_156_),
    .B(_164_),
    .Y(_116_)
  );
  ANX1_CV _338_ (
    .A(_146_),
    .B(_163_),
    .Y(_165_)
  );
  EOX1_CV _339_ (
    .A(_146_),
    .B(_163_),
    .Y(_166_)
  );
  ANX1_CV _340_ (
    .A(_156_),
    .B(_166_),
    .Y(_117_)
  );
  ORX1_CV _341_ (
    .A(_147_),
    .B(_165_),
    .Y(_167_)
  );
  ANX1_CV _342_ (
    .A(_147_),
    .B(_146_),
    .Y(_168_)
  );
  ANX1_CV _343_ (
    .A(_163_),
    .B(_168_),
    .Y(_169_)
  );
  NRX1_CV _344_ (
    .A(_157_),
    .B(_169_),
    .Y(_170_)
  );
  ANX1_CV _345_ (
    .A(_167_),
    .B(_170_),
    .Y(_118_)
  );
  NDX1_CV _346_ (
    .A(_148_),
    .B(_169_),
    .Y(_171_)
  );
  ORX1_CV _347_ (
    .A(_148_),
    .B(_169_),
    .Y(_172_)
  );
  ANX1_CV _348_ (
    .A(_156_),
    .B(_172_),
    .Y(_173_)
  );
  ANX1_CV _349_ (
    .A(_171_),
    .B(_173_),
    .Y(_119_)
  );
  NDX1_CV _350_ (
    .A(_220_),
    .B(_171_),
    .Y(_174_)
  );
  ANX1_CV _351_ (
    .A(_149_),
    .B(_148_),
    .Y(_175_)
  );
  ANX1_CV _352_ (
    .A(_168_),
    .B(_175_),
    .Y(_176_)
  );
  ANX1_CV _353_ (
    .A(_163_),
    .B(_176_),
    .Y(_177_)
  );
  NRX1_CV _354_ (
    .A(_157_),
    .B(_177_),
    .Y(_178_)
  );
  ANX1_CV _355_ (
    .A(_174_),
    .B(_178_),
    .Y(_120_)
  );
  ANX1_CV _356_ (
    .A(_150_),
    .B(_177_),
    .Y(_179_)
  );
  ORX1_CV _357_ (
    .A(_150_),
    .B(_177_),
    .Y(_180_)
  );
  NDX1_CV _358_ (
    .A(_156_),
    .B(_180_),
    .Y(_181_)
  );
  NRX1_CV _359_ (
    .A(_179_),
    .B(_181_),
    .Y(_121_)
  );
  ANX1_CV _360_ (
    .A(_151_),
    .B(_179_),
    .Y(_182_)
  );
  ORX1_CV _361_ (
    .A(_151_),
    .B(_179_),
    .Y(_183_)
  );
  NDX1_CV _362_ (
    .A(_156_),
    .B(_183_),
    .Y(_184_)
  );
  NRX1_CV _363_ (
    .A(_182_),
    .B(_184_),
    .Y(_122_)
  );
  ANX1_CV _364_ (
    .A(_137_),
    .B(_182_),
    .Y(_185_)
  );
  ORX1_CV _365_ (
    .A(_137_),
    .B(_182_),
    .Y(_186_)
  );
  NDX1_CV _366_ (
    .A(_156_),
    .B(_186_),
    .Y(_187_)
  );
  NRX1_CV _367_ (
    .A(_185_),
    .B(_187_),
    .Y(_108_)
  );
  ANX1_CV _368_ (
    .A(_138_),
    .B(_185_),
    .Y(_188_)
  );
  ORX1_CV _369_ (
    .A(_138_),
    .B(_185_),
    .Y(_189_)
  );
  NDX1_CV _370_ (
    .A(_156_),
    .B(_189_),
    .Y(_190_)
  );
  NRX1_CV _371_ (
    .A(_188_),
    .B(_190_),
    .Y(_109_)
  );
  ANX1_CV _372_ (
    .A(_139_),
    .B(_188_),
    .Y(_191_)
  );
  ORX1_CV _373_ (
    .A(_139_),
    .B(_188_),
    .Y(_192_)
  );
  NDX1_CV _374_ (
    .A(_156_),
    .B(_192_),
    .Y(_193_)
  );
  NRX1_CV _375_ (
    .A(_191_),
    .B(_193_),
    .Y(_110_)
  );
  ANX1_CV _376_ (
    .A(_140_),
    .B(_191_),
    .Y(_194_)
  );
  ORX1_CV _377_ (
    .A(_140_),
    .B(_191_),
    .Y(_195_)
  );
  NDX1_CV _378_ (
    .A(_156_),
    .B(_195_),
    .Y(_196_)
  );
  NRX1_CV _379_ (
    .A(_194_),
    .B(_196_),
    .Y(_111_)
  );
  NDX1_CV _380_ (
    .A(_141_),
    .B(_194_),
    .Y(_197_)
  );
  ORX1_CV _381_ (
    .A(_141_),
    .B(_194_),
    .Y(_198_)
  );
  ANX1_CV _382_ (
    .A(_156_),
    .B(_198_),
    .Y(_199_)
  );
  ANX1_CV _383_ (
    .A(_197_),
    .B(_199_),
    .Y(_112_)
  );
  ENX1_CV _384_ (
    .A(_142_),
    .B(_197_),
    .Y(_200_)
  );
  ANX1_CV _385_ (
    .A(_156_),
    .B(_200_),
    .Y(_113_)
  );
  NDX1_CV _386_ (
    .A(_134_),
    .B(_129_),
    .Y(_201_)
  );
  NDX1_CV _387_ (
    .A(_226_),
    .B(_201_),
    .Y(_202_)
  );
  ORX1_CV _388_ (
    .A(_247_),
    .B(_202_),
    .Y(_126_)
  );
  ORX1_CV _389_ (
    .A(_135_),
    .B(_224_),
    .Y(_203_)
  );
  ANX1_CV _390_ (
    .A(_230_),
    .B(_203_),
    .Y(_127_)
  );
  ANX1_CV _391_ (
    .A(_221_),
    .B(_105_),
    .Y(_128_)
  );
  ANX1_CV _392_ (
    .A(_222_),
    .B(_224_),
    .Y(_131_)
  );
  NDX1_CV _393_ (
    .A(_222_),
    .B(_227_),
    .Y(_204_)
  );
  ORX1_CV _394_ (
    .A(_222_),
    .B(_129_),
    .Y(_130_)
  );
  NDX1_CV _395_ (
    .A(_123_),
    .B(_246_),
    .Y(_205_)
  );
  ANX1_CV _396_ (
    .A(_241_),
    .B(_158_),
    .Y(_206_)
  );
  NDX1_CV _397_ (
    .A(_238_),
    .B(_206_),
    .Y(_207_)
  );
  ORX1_CV _398_ (
    .A(_144_),
    .B(_207_),
    .Y(_208_)
  );
  NDX1_CV _399_ (
    .A(_129_),
    .B(_208_),
    .Y(_209_)
  );
  ANX1_CV _400_ (
    .A(_219_),
    .B(_143_),
    .Y(_210_)
  );
  ANX1_CV _401_ (
    .A(_162_),
    .B(_210_),
    .Y(_211_)
  );
  NDX1_CV _402_ (
    .A(_176_),
    .B(_211_),
    .Y(_212_)
  );
  ORX1_CV _403_ (
    .A(_237_),
    .B(_212_),
    .Y(_213_)
  );
  NDX1_CV _404_ (
    .A(_225_),
    .B(_213_),
    .Y(_214_)
  );
  ORX1_CV _405_ (
    .A(_152_),
    .B(_204_),
    .Y(_215_)
  );
  ANX1_CV _406_ (
    .A(_205_),
    .B(_214_),
    .Y(_216_)
  );
  ANX1_CV _407_ (
    .A(_209_),
    .B(_216_),
    .Y(_217_)
  );
  ANX1_CV _408_ (
    .A(_215_),
    .B(_217_),
    .Y(_132_)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _409_ (
    .CK(clk),
    .D(next_state[0]),
    .Q(state[0]),
    .QN(_261_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _410_ (
    .CK(clk),
    .D(next_state[1]),
    .Q(state[1]),
    .QN(_262_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _411_ (
    .CK(clk),
    .D(next_state[2]),
    .Q(state[2]),
    .QN(_263_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _412_ (
    .CK(clk),
    .D(next_state[3]),
    .Q(state[3]),
    .QN(_264_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _413_ (
    .CK(clk),
    .D(_002_[0]),
    .Q(counter[0]),
    .QN(_265_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _414_ (
    .CK(clk),
    .D(_002_[1]),
    .Q(counter[1]),
    .QN(_266_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _415_ (
    .CK(clk),
    .D(_002_[2]),
    .Q(counter[2]),
    .QN(_267_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _416_ (
    .CK(clk),
    .D(_002_[3]),
    .Q(counter[3]),
    .QN(_268_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _417_ (
    .CK(clk),
    .D(_002_[4]),
    .Q(counter[4]),
    .QN(_269_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _418_ (
    .CK(clk),
    .D(_002_[5]),
    .Q(counter[5]),
    .QN(_270_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _419_ (
    .CK(clk),
    .D(_002_[6]),
    .Q(counter[6]),
    .QN(_271_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _420_ (
    .CK(clk),
    .D(_002_[7]),
    .Q(counter[7]),
    .QN(_272_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _421_ (
    .CK(clk),
    .D(_002_[8]),
    .Q(counter[8]),
    .QN(_273_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _422_ (
    .CK(clk),
    .D(_002_[9]),
    .Q(counter[9]),
    .QN(_274_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _423_ (
    .CK(clk),
    .D(_002_[10]),
    .Q(counter[10]),
    .QN(_275_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _424_ (
    .CK(clk),
    .D(_002_[11]),
    .Q(counter[11]),
    .QN(_276_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _425_ (
    .CK(clk),
    .D(_002_[12]),
    .Q(counter[12]),
    .QN(_277_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _426_ (
    .CK(clk),
    .D(_002_[13]),
    .Q(counter[13]),
    .QN(_278_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _427_ (
    .CK(clk),
    .D(_002_[14]),
    .Q(counter[14]),
    .QN(_279_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:28" *)
  DFSRQNX1_CV _428_ (
    .CK(clk),
    .D(_002_[15]),
    .Q(counter[15]),
    .QN(_280_),
    .R(1'h0),
    .S(1'h0)
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _429_ (
    .D(_003_),
    .E(_008_),
    .Q(erase)
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _430_ (
    .D(_001_),
    .E(_009_),
    .Q(corr)
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _431_ (
    .D(_004_),
    .E(_008_),
    .Q(expose)
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _432_ (
    .D(_000_),
    .E(_008_),
    .Q(convert)
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _433_ (
    .D(_007_),
    .E(_008_),
    .Q(read)
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _434_ (
    .D(_005_),
    .E(_008_),
    .Q(idle)
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _435_ (
    .D(_006_[0]),
    .E(_010_),
    .Q(next_state[0])
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _436_ (
    .D(_006_[1]),
    .E(_010_),
    .Q(next_state[1])
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _437_ (
    .D(_006_[2]),
    .E(_010_),
    .Q(next_state[2])
  );
  (* src = "data_path.sv:38" *)
  \$_DLATCH_P_  _438_ (
    .D(1'h0),
    .E(_010_),
    .Q(next_state[3])
  );
  assign _259_ = state[2];
  assign _260_ = state[3];
  assign _003_ = _123_;
  assign _258_ = state[1];
  assign _257_ = state[0];
  assign _000_ = _105_;
  assign _004_ = _124_;
  assign _007_ = _129_;
  assign _136_ = counter[0];
  assign pixel_select[0] = _255_;
  assign _143_ = counter[1];
  assign pixel_select[1] = _256_;
  assign _005_ = _125_;
  assign _145_ = counter[3];
  assign _144_ = counter[2];
  assign _147_ = counter[5];
  assign _146_ = counter[4];
  assign _149_ = counter[7];
  assign _148_ = counter[6];
  assign _151_ = counter[9];
  assign _150_ = counter[8];
  assign _138_ = counter[11];
  assign _137_ = counter[10];
  assign _140_ = counter[13];
  assign _139_ = counter[12];
  assign _142_ = counter[15];
  assign _141_ = counter[14];
  assign _133_ = cds;
  assign _001_ = _106_;
  assign _251_ = next_state[0];
  assign _252_ = next_state[1];
  assign _253_ = next_state[2];
  assign _254_ = next_state[3];
  assign _002_[0] = _107_;
  assign _002_[1] = _114_;
  assign _002_[2] = _115_;
  assign _002_[3] = _116_;
  assign _002_[4] = _117_;
  assign _002_[5] = _118_;
  assign _002_[6] = _119_;
  assign _002_[7] = _120_;
  assign _002_[8] = _121_;
  assign _002_[9] = _122_;
  assign _002_[10] = _108_;
  assign _002_[11] = _109_;
  assign _002_[12] = _110_;
  assign _002_[13] = _111_;
  assign _002_[14] = _112_;
  assign _002_[15] = _113_;
  assign _134_ = cont_mode;
  assign _006_[0] = _126_;
  assign _135_ = corr;
  assign _006_[1] = _127_;
  assign _006_[2] = _128_;
  assign _009_ = _131_;
  assign _008_ = _130_;
  assign _152_ = enable;
  assign _010_ = _132_;
endmodule
