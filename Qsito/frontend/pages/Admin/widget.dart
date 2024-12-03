import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'admin_model.dart';
export 'admin_model.dart';

class AdminWidget extends StatefulWidget {
  const AdminWidget({super.key});

  @override
  State<AdminWidget> createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  late AdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textFieldFocusNode3!.addListener(() => safeSetState(() {}));
    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 24,
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'Contract',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).info,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: [
            FlutterFlowIconButton(
              buttonSize: 48,
              icon: Icon(
                Icons.logout,
                color: FlutterFlowTheme.of(context).info,
                size: 24,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 277,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 8),
                          child: Text(
                            'Judge account:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController1,
                              focusNode: _model.textFieldFocusNode1,
                              onFieldSubmitted: (_) async {
                                FFAppState().account =
                                    _model.textController1.text;
                              },
                              autofocus: false,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFAppState().account != null &&
                                        FFAppState().account != ''
                                    ? FFAppState().account
                                    : 'Account address...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 8),
                          child: Text(
                            'Contract:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController2,
                              focusNode: _model.textFieldFocusNode2,
                              onFieldSubmitted: (_) async {
                                FFAppState().contract =
                                    _model.textController2.text;
                                safeSetState(() {});
                                _model.listaQuesitos =
                                    await actions.getQuesitos(
                                  context,
                                  FFAppState().wallet.privateKey,
                                  FFAppState().contract,
                                  FFAppState().rpc,
                                );
                                if (FFAppState().quesito.length == 0) {
                                  FFAppState().quesito = _model.listaQuesitos!
                                      .toList()
                                      .cast<String>();
                                  safeSetState(() {});
                                } else {
                                  if (FFAppState().escola.length == 0) {
                                    _model.resultGetEscolas =
                                        await actions.getEscolas(
                                      context,
                                      FFAppState().wallet.privateKey,
                                      FFAppState().contract,
                                      FFAppState().rpc,
                                    );
                                    FFAppState().escola = _model
                                        .resultGetEscolas!
                                        .toList()
                                        .cast<String>();
                                    safeSetState(() {});
                                  }
                                }

                                safeSetState(() {});
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFAppState().contract != null &&
                                        FFAppState().contract != ''
                                    ? FFAppState().contract
                                    : 'Contract address...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Text(
                            'Messages:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: (FFAppState().hasTransaction == true) ||
                                      (_model.hash != null && _model.hash != '')
                                  ? Color(0xFF52E7D9)
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 0, 8),
                                      child: SelectionArea(
                                          child: Text(
                                        _model.hash != null && _model.hash != ''
                                            ? _model.hash!
                                            : ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.42,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Add New Judge',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                TextFormField(
                                  controller: _model.textController3,
                                  focusNode: _model.textFieldFocusNode3,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Judge Name',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  minLines: 1,
                                  validator: _model.textController3Validator
                                      .asValidator(context),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dDQuesitoValueController ??=
                                          FormFieldController<String>(null),
                                  options: FFAppState().quesito,
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.dDQuesitoValue = val);
                                    FFAppState().quesitoId =
                                        functions.getIndexFromDDitenSelected(
                                            _model.dDQuesitoValue!,
                                            FFAppState().quesito.toList());
                                    safeSetState(() {});
                                  },
                                  width: 397,
                                  height: 40,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Select Quesito...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2,
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderWidth: 1,
                                  borderRadius: 8,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if ((_model.textController3.text != null &&
                                            _model.textController3.text !=
                                                '') &&
                                        (_model.dDQuesitoValue != null &&
                                            _model.dDQuesitoValue != '')) {
                                      _model.resultAddJudge =
                                          await actions.addJudge(
                                        context,
                                        FFAppState().wallet.privateKey,
                                        FFAppState().contract,
                                        FFAppState().rpc,
                                        _model.textController3.text,
                                        FFAppState().quesitoId,
                                      );
                                      FFAppState().isSending = true;
                                      safeSetState(() {});
                                      if (_model.resultAddJudge != null &&
                                          _model.resultAddJudge != '') {
                                        FFAppState().addToJudge(
                                            _model.textController3.text);
                                        FFAppState().hasTransaction = true;
                                        safeSetState(() {});
                                        _model.hash = _model.resultAddJudge;
                                        safeSetState(() {});

                                        safeSetState(() {});
                                        safeSetState(() {
                                          _model.textController3?.clear();
                                        });
                                        safeSetState(() {
                                          _model.dDQuesitoValueController
                                              ?.reset();
                                        });
                                        FFAppState().quesitoId = 0;
                                        safeSetState(() {});
                                      }
                                    } else {
                                      _model.hash =
                                          'Nome do jurado ou Quesito inválidos!';
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'AddJurado',
                                  options: FFButtonOptions(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 50,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Text(
                                  'Current Judges: ${FFAppState().judge.length.toString()}/36',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 16)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.42,
                        height: 250,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                              child: Text(
                                'Judges',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 18,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final listaJurados =
                                    FFAppState().judge.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listaJurados.length,
                                  itemBuilder: (context, listaJuradosIndex) {
                                    final listaJuradosItem =
                                        listaJurados[listaJuradosIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: Text(
                                            listaJuradosIndex.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: Text(
                                            listaJuradosItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View Scores',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller: _model.dDEscolaValueController ??=
                                      FormFieldController<String>(null),
                                  options: FFAppState().escola,
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.dDEscolaValue = val);
                                    FFAppState().escolaId =
                                        functions.getIndexFromDDitenSelected(
                                            _model.dDEscolaValue!,
                                            FFAppState().escola.toList());
                                    safeSetState(() {});
                                  },
                                  width: 431,
                                  height: 40,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Select Escola...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2,
                                  borderColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  borderWidth: 1,
                                  borderRadius: 8,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dDQuesitoScoreValueController ??=
                                          FormFieldController<String>(null),
                                  options: FFAppState().quesito,
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.dDQuesitoScoreValue = val);
                                    FFAppState().quesitoIdScore =
                                        functions.getIndexFromDDitenSelected(
                                            _model.dDQuesitoScoreValue!,
                                            FFAppState().quesito.toList());
                                    safeSetState(() {});
                                  },
                                  width: 450,
                                  height: 40,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Select Quesito...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2,
                                  borderColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  borderWidth: 0,
                                  borderRadius: 8,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    if ((_model.dDEscolaValue != null &&
                                            _model.dDEscolaValue != '') &&
                                        (_model.dDQuesitoScoreValue != null &&
                                            _model.dDQuesitoScoreValue != '')) {
                                      _model.resultGetNota =
                                          await actions.getNota(
                                        context,
                                        FFAppState().wallet.privateKey,
                                        FFAppState().contract,
                                        FFAppState().rpc,
                                        FFAppState().escolaId,
                                        FFAppState().quesitoId,
                                      );
                                      safeSetState(() {
                                        _model.dDEscolaValueController?.reset();
                                        _model.dDQuesitoScoreValueController
                                            ?.reset();
                                      });
                                    } else {
                                      _model.hash =
                                          'Escola ou Quesito são inválidos!';
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'View Score',
                                  options: FFButtonOptions(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.425,
                                    height: 50,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  width: 450,
                                  decoration: BoxDecoration(),
                                  child: TextFormField(
                                    controller: _model.textController4,
                                    focusNode: _model.textFieldFocusNode4,
                                    autofocus: false,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText: 'Score',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: valueOrDefault<String>(
                                        _model.resultGetNota?.toString(),
                                        '0.00',
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 20,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    textAlign: TextAlign.center,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textController4Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 16)),
                        ),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Clear All Data',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width,
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).error,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ].divide(SizedBox(height: 24)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

