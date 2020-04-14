import 'package:flutter/cupertino.dart';

class RequestModel{
  String LBRRY_SEQ_NO;
  String LBRRY_NAME;
  String GU_CODE;
  String CODE_VALUE;
  String ADRES;
  String TEL_NO;
  String FXNUM;
  String HMPG_URL;
  String OP_TIME;
  String FDRM_CLOSE_DATE;
  String LBRRY_SE_NAME;
  String XCNTS;
  String YDNTS;
  String CHARGER_EMAIL;
  String LBRRY_INTRCN;
  String FOND_YEAR;
  String MBER_SBSCRB_RQISIT;
  String LON_GDCC;
  String TFCMN;
  String FLOOR_DC;

  RequestModel({
    @required this.LBRRY_SEQ_NO,
    @required this.LBRRY_NAME,
    @required this.GU_CODE,
    @required this.CODE_VALUE,
    @required this.ADRES,
    @required this.TEL_NO,
    @required this.FXNUM,
    @required this.HMPG_URL,
    @required this.OP_TIME,
    @required this.FDRM_CLOSE_DATE,
    @required this.LBRRY_SE_NAME,
    @required this.XCNTS,
    @required this.YDNTS,
    @required this.CHARGER_EMAIL,
    @required this.LBRRY_INTRCN,
    @required this.FOND_YEAR,
    @required this.MBER_SBSCRB_RQISIT,
    @required this.LON_GDCC,
    @required this.TFCMN,
    @required this.FLOOR_DC,
  });

  factory RequestModel.toJson(Map<String, dynamic> json) =>
    RequestModel(
      LBRRY_SEQ_NO: json['LBRRY_SEQ_NO'],
      LBRRY_NAME: json['LBRRY_NAME'],
      GU_CODE: json['GU_CODE'],
      CODE_VALUE: json['CODE_VALUE'],
      ADRES: json['ADRES'],
      TEL_NO: json['TEL_NO'],
      FXNUM: json['FXNUM'],
      HMPG_URL: json['HMPG_URL'],
      OP_TIME: json['OP_TIME'],
      FDRM_CLOSE_DATE: json['FDRM_CLOSE_DATE'],
      LBRRY_SE_NAME: json['LBRRY_SE_NAME'],
      XCNTS: json['XCNTS'],
      YDNTS: json['YDNTS'],
      CHARGER_EMAIL: json['CHARGER_EMAIL'],
      LBRRY_INTRCN: json['LBRRY_INTRCN'],
      FOND_YEAR: json['FOND_YEAR'],
      MBER_SBSCRB_RQISIT: json['MBER_SBSCRB_RQISIT'],
      LON_GDCC: json['LON_GDCC'],
      TFCMN: json['TFCMN'],
      FLOOR_DC: json['FLOOR_DC']
    );
}