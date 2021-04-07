within FLEXLAB;
package Examples

  model Guideline36_3zones
    "Variable air volume flow system with terminal reheat and five thermal zones"
    extends Modelica.Icons.Example;
    extends FLEXLAB.BaseClasses.PartialOpenLoop_3zones(redeclare
        FLEXLAB.BaseClasses.Floor_3zones flo(lat=0.66098585832754));

    parameter Modelica.SIunits.VolumeFlowRate VPriSysMax_flow=m_flow_nominal/1.2
      "Maximum expected system primary airflow rate at design stage";
    parameter Modelica.SIunits.VolumeFlowRate minZonPriFlo[numZon]={
      conVAVCor.VDisSetMin_flow, conVAVSou.VDisSetMin_flow, conVAVNor.VDisSetMin_flow}
      "Minimum expected zone primary flow rate";
    parameter Modelica.SIunits.Time samplePeriod=120
      "Sample period of component, set to the same value as the trim and respond that process yPreSetReq";
    parameter Modelica.SIunits.PressureDifference dpDisRetMax=40
      "Maximum return fan discharge static pressure setpoint";

    Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Controller conVAVCor(
      V_flow_nominal=mCor_flow_nominal/1.2,
      AFlo=AFloCor,
      final samplePeriod=samplePeriod,
      VDisSetMin_flow=max(1.5*VCorOA_flow_nominal, 0.15*mCor_flow_nominal/1.2))
      "Controller for terminal unit corridor"
      annotation (Placement(transformation(extent={{530,32},{550,52}})));
    Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Controller conVAVSou(
      V_flow_nominal=mSou_flow_nominal/1.2,
      AFlo=AFloSou,
      final samplePeriod=samplePeriod,
      VDisSetMin_flow=max(1.5*VSouOA_flow_nominal, 0.15*mSou_flow_nominal/1.2))
      "Controller for terminal unit south"
      annotation (Placement(transformation(extent={{700,30},{720,50}})));
    Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Controller conVAVNor(
      V_flow_nominal=mNor_flow_nominal/1.2,
      AFlo=AFloNor,
      final samplePeriod=samplePeriod,
      VDisSetMin_flow=max(1.5*VNorOA_flow_nominal, 0.15*mNor_flow_nominal/1.2))
      "Controller for terminal unit north"
      annotation (Placement(transformation(extent={{854,32},{874,52}})));

    Modelica.Blocks.Routing.Multiplex3 TDis "Discharge air temperatures"
      annotation (Placement(transformation(extent={{220,360},{240,380}})));
    Modelica.Blocks.Routing.Multiplex3 VDis_flow
      "Air flow rate at the terminal boxes"
      annotation (Placement(transformation(extent={{220,320},{240,340}})));
    Buildings.Controls.OBC.CDL.Integers.MultiSum TZonResReq(nin=3)
      "Number of zone temperature requests"
      annotation (Placement(transformation(extent={{300,360},{320,380}})));
    Buildings.Controls.OBC.CDL.Integers.MultiSum PZonResReq(nin=3)
      "Number of zone pressure requests"
      annotation (Placement(transformation(extent={{300,320},{320,340}})));
    Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yOutDam(k=1)
      "Outdoor air damper control signal"
      annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
    Buildings.Controls.OBC.CDL.Logical.Switch swiFreSta "Switch for freeze stat"
      annotation (Placement(transformation(extent={{60,-202},{80,-182}})));
    Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yFreHeaCoi(final k=1)
      "Flow rate signal for heating coil when freeze stat is on"
      annotation (Placement(transformation(extent={{0,-192},{20,-172}})));
    Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.Controller conAHU(
      kMinOut=0.03,
      final pMaxSet=410,
      final yFanMin=yFanMin,
      final VPriSysMax_flow=VPriSysMax_flow,
      final peaSysPop=divP*sum({ratP_A*AFlo[i] for i in 1:numZon}))
      "AHU controller"
      annotation (Placement(transformation(extent={{340,512},{420,640}})));
    Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.Zone
      zonOutAirSet[numZon](
      final AFlo=AFlo,
      final have_occSen=fill(false, numZon),
      final have_winSen=fill(false, numZon),
      final desZonPop={ratP_A*AFlo[i] for i in 1:numZon},
      final minZonPriFlo=minZonPriFlo)
      "Zone level calculation of the minimum outdoor airflow setpoint"
      annotation (Placement(transformation(extent={{220,580},{240,600}})));
    Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.SumZone
      zonToSys(final numZon=numZon) "Sum up zone calculation output"
      annotation (Placement(transformation(extent={{280,570},{300,590}})));
    Buildings.Controls.OBC.CDL.Routing.RealReplicator reaRep1(final nout=numZon)
      "Replicate design uncorrected minimum outdoor airflow setpoint"
      annotation (Placement(transformation(extent={{460,580},{480,600}})));
    Buildings.Controls.OBC.CDL.Routing.BooleanReplicator booRep1(final nout=numZon)
      "Replicate signal whether the outdoor airflow is required"
      annotation (Placement(transformation(extent={{460,550},{480,570}})));

    Buildings.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.ZoneStatus zonSta[numZon]
      "Check zone temperature status"
      annotation (Placement(transformation(extent={{-220,268},{-200,296}})));
    Buildings.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.GroupStatus zonGroSta(
      final numZon=numZon) "Check zone group status according to the zones status"
      annotation (Placement(transformation(extent={{-160,260},{-140,300}})));
    Buildings.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.OperationMode
      opeModSel(final numZon=numZon)
      annotation (Placement(transformation(extent={{-100,284},{-80,316}})));
    Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.SetPoints.ZoneTemperatures
      TZonSet[numZon](
      final have_occSen=fill(false, numZon),
      final have_winSen=fill(false, numZon))  "Zone setpoint"
      annotation (Placement(transformation(extent={{-100,180},{-80,208}})));
    Buildings.Controls.OBC.CDL.Continuous.Sources.Constant warCooTim[numZon](
      final k=fill(1800, numZon)) "Warm up and cool down time"
      annotation (Placement(transformation(extent={{-300,370},{-280,390}})));
    Buildings.Controls.OBC.CDL.Logical.Sources.Constant falSta[numZon](
      final k=fill(false, numZon))
      "All windows are closed, no zone has override switch"
      annotation (Placement(transformation(extent={{-300,330},{-280,350}})));
    Buildings.Controls.OBC.CDL.Routing.RealReplicator reaRep(nout=numZon)
      "Assume all zones have same occupancy schedule"
      annotation (Placement(transformation(extent={{-200,-190},{-180,-170}})));
    Buildings.Controls.OBC.CDL.Routing.BooleanReplicator booRep(nout=numZon)
      "Assume all zones have same occupancy schedule"
      annotation (Placement(transformation(extent={{-200,-150},{-180,-130}})));
    Buildings.Controls.OBC.CDL.Integers.Sources.Constant demLimLev[numZon](
      final  k=fill(0, numZon)) "Demand limit level, assumes to be 0"
      annotation (Placement(transformation(extent={{-300,230},{-280,250}})));
    Buildings.Controls.OBC.CDL.Routing.IntegerReplicator intRep(
      final nout=numZon)
      "All zones in same operation mode"
      annotation (Placement(transformation(extent={{-140,220},{-120,240}})));

  equation

    connect(conVAVCor.TDis, TSupCor.T) annotation (Line(points={{528,36},{522,36},
            {522,40},{514,40},{514,92},{569,92}}, color={0,0,127}));
    connect(TSupSou.T, conVAVSou.TDis) annotation (Line(points={{749,92},{688,92},
            {688,34},{698,34}}, color={0,0,127}));
    connect(TSupNor.T, conVAVNor.TDis) annotation (Line(points={{899,90},{816,
            90},{816,36},{852,36}},   color={0,0,127}));
    connect(cor.yVAV, conVAVCor.yDam) annotation (Line(points={{566,50},{556,50},{
            556,48},{552,48}}, color={0,0,127}));
    connect(cor.yVal, conVAVCor.yVal) annotation (Line(points={{566,34},{560,34},{
            560,43},{552,43}}, color={0,0,127}));
    connect(conVAVSou.yDam, sou.yVAV) annotation (Line(points={{722,46},{730,46},{
            730,48},{746,48}}, color={0,0,127}));
    connect(conVAVSou.yVal, sou.yVal) annotation (Line(points={{722,41},{732.5,41},
            {732.5,32},{746,32}}, color={0,0,127}));
    connect(conVAVNor.yDam, nor.yVAV) annotation (Line(points={{876,48},{888,48},
            {888,50},{898,50}},         color={0,0,127}));
    connect(conVAVNor.yVal, nor.yVal) annotation (Line(points={{876,43},{894.5,
            43},{894.5,34},{898,34}},   color={0,0,127}));
    connect(conVAVCor.yZonTemResReq, TZonResReq.u[1]) annotation (Line(points={{552,38},
            {554,38},{554,220},{280,220},{280,374.667},{298,374.667}},     color=
            {255,127,0}));
    connect(conVAVSou.yZonTemResReq, TZonResReq.u[2]) annotation (Line(points={{722,36},
            {726,36},{726,220},{280,220},{280,370},{298,370}},             color=
            {255,127,0}));
    connect(conVAVNor.yZonTemResReq, TZonResReq.u[3]) annotation (Line(points={{876,38},
            {1064,38},{1064,222},{280,222},{280,365.333},{298,365.333}},
          color={255,127,0}));
    connect(conVAVCor.yZonPreResReq, PZonResReq.u[1]) annotation (Line(points={{552,34},
            {558,34},{558,214},{288,214},{288,334.667},{298,334.667}},     color=
            {255,127,0}));
    connect(conVAVSou.yZonPreResReq, PZonResReq.u[2]) annotation (Line(points={{722,32},
            {728,32},{728,214},{288,214},{288,330},{298,330}},             color=
            {255,127,0}));
    connect(conVAVNor.yZonPreResReq, PZonResReq.u[3]) annotation (Line(points={{876,34},
            {1066,34},{1066,216},{288,216},{288,325.333},{298,325.333}},
          color={255,127,0}));

    connect(VSupCor_flow.V_flow, VDis_flow.u1[1]) annotation (Line(points={{569,130},
            {472,130},{472,206},{180,206},{180,337},{218,337}},      color={0,0,
            127}));
    connect(VSupSou_flow.V_flow, VDis_flow.u2[1]) annotation (Line(points={{749,130},
            {742,130},{742,206},{180,206},{180,330},{218,330}},      color={0,0,
            127}));

    connect(TSupCor.T, TDis.u1[1]) annotation (Line(points={{569,92},{466,92},{
            466,210},{176,210},{176,377},{218,377}}, color={0,0,127}));
    connect(TSupSou.T, TDis.u2[1]) annotation (Line(points={{749,92},{688,92},{
            688,210},{176,210},{176,370},{218,370}},                   color={0,0,
            127}));
    connect(conVAVCor.VDis_flow, VSupCor_flow.V_flow) annotation (Line(points={{528,40},
            {522,40},{522,130},{569,130}}, color={0,0,127}));
    connect(VSupSou_flow.V_flow, conVAVSou.VDis_flow) annotation (Line(points={{749,130},
            {690,130},{690,38},{698,38}},      color={0,0,127}));
    connect(VSupNor_flow.V_flow, conVAVNor.VDis_flow) annotation (Line(points={{901,156},
            {836,156},{836,40},{852,40}},         color={0,0,127}));

    connect(TSup.T, conVAVCor.TSupAHU) annotation (Line(points={{340,-29},{340,
            -20},{514,-20},{514,34},{528,34}},
                                          color={0,0,127}));
    connect(TSup.T, conVAVSou.TSupAHU) annotation (Line(points={{340,-29},{340,
            -20},{686,-20},{686,32},{698,32}},
                                          color={0,0,127}));
    connect(TSup.T, conVAVNor.TSupAHU) annotation (Line(points={{340,-29},{340,
            -22},{828,-22},{828,34},{852,34}},
                                             color={0,0,127}));
    connect(yOutDam.y, eco.yExh)
      annotation (Line(points={{-18,-10},{-3,-10},{-3,-34}}, color={0,0,127}));
    connect(swiFreSta.y, gaiHeaCoi.u) annotation (Line(points={{82,-192},{88,-192},
            {88,-210},{98,-210}}, color={0,0,127}));
    connect(freSta.y, swiFreSta.u2) annotation (Line(points={{22,-90},{40,-90},{
            40,-192},{58,-192}}, color={255,0,255}));
    connect(yFreHeaCoi.y, swiFreSta.u1) annotation (Line(points={{22,-182},{40,-182},
            {40,-184},{58,-184}}, color={0,0,127}));
    connect(zonToSys.ySumDesZonPop, conAHU.sumDesZonPop) annotation (Line(points={{302,589},
            {308,589},{308,609.778},{336,609.778}},           color={0,0,127}));
    connect(zonToSys.VSumDesPopBreZon_flow, conAHU.VSumDesPopBreZon_flow)
      annotation (Line(points={{302,586},{310,586},{310,604.444},{336,604.444}},
          color={0,0,127}));
    connect(zonToSys.VSumDesAreBreZon_flow, conAHU.VSumDesAreBreZon_flow)
      annotation (Line(points={{302,583},{312,583},{312,599.111},{336,599.111}},
          color={0,0,127}));
    connect(zonToSys.yDesSysVenEff, conAHU.uDesSysVenEff) annotation (Line(points={{302,580},
            {314,580},{314,593.778},{336,593.778}},           color={0,0,127}));
    connect(zonToSys.VSumUncOutAir_flow, conAHU.VSumUncOutAir_flow) annotation (
        Line(points={{302,577},{316,577},{316,588.444},{336,588.444}}, color={0,0,
            127}));
    connect(zonToSys.VSumSysPriAir_flow, conAHU.VSumSysPriAir_flow) annotation (
        Line(points={{302,571},{318,571},{318,583.111},{336,583.111}}, color={0,0,
            127}));
    connect(zonToSys.uOutAirFra_max, conAHU.uOutAirFra_max) annotation (Line(
          points={{302,574},{320,574},{320,577.778},{336,577.778}}, color={0,0,127}));
    connect(zonOutAirSet.yDesZonPeaOcc, zonToSys.uDesZonPeaOcc) annotation (Line(
          points={{242,599},{270,599},{270,588},{278,588}},     color={0,0,127}));
    connect(zonOutAirSet.VDesPopBreZon_flow, zonToSys.VDesPopBreZon_flow)
      annotation (Line(points={{242,596},{268,596},{268,586},{278,586}},
                                                       color={0,0,127}));
    connect(zonOutAirSet.VDesAreBreZon_flow, zonToSys.VDesAreBreZon_flow)
      annotation (Line(points={{242,593},{266,593},{266,584},{278,584}},
          color={0,0,127}));
    connect(zonOutAirSet.yDesPriOutAirFra, zonToSys.uDesPriOutAirFra) annotation (
       Line(points={{242,590},{264,590},{264,578},{278,578}},     color={0,0,127}));
    connect(zonOutAirSet.VUncOutAir_flow, zonToSys.VUncOutAir_flow) annotation (
        Line(points={{242,587},{262,587},{262,576},{278,576}},     color={0,0,127}));
    connect(zonOutAirSet.yPriOutAirFra, zonToSys.uPriOutAirFra)
      annotation (Line(points={{242,584},{260,584},{260,574},{278,574}},
                                                       color={0,0,127}));
    connect(zonOutAirSet.VPriAir_flow, zonToSys.VPriAir_flow) annotation (Line(
          points={{242,581},{258,581},{258,572},{278,572}},     color={0,0,127}));
    connect(conAHU.yAveOutAirFraPlu, zonToSys.yAveOutAirFraPlu) annotation (Line(
          points={{424,586.667},{440,586.667},{440,468},{270,468},{270,582},{
            278,582}},
          color={0,0,127}));
    connect(conAHU.VDesUncOutAir_flow, reaRep1.u) annotation (Line(points={{424,
            597.333},{440,597.333},{440,590},{458,590}},
                                                color={0,0,127}));
    connect(reaRep1.y, zonOutAirSet.VUncOut_flow_nominal) annotation (Line(points={{482,590},
            {490,590},{490,464},{210,464},{210,581},{218,581}},          color={0,
            0,127}));
    connect(conAHU.yReqOutAir, booRep1.u) annotation (Line(points={{424,565.333},
            {444,565.333},{444,560},{458,560}},color={255,0,255}));
    connect(booRep1.y, zonOutAirSet.uReqOutAir) annotation (Line(points={{482,560},
            {496,560},{496,460},{206,460},{206,593},{218,593}}, color={255,0,255}));
    connect(flo.TRooAir, zonOutAirSet.TZon) annotation (Line(points={{915.13,
            504},{1164,504},{1164,662},{210,662},{210,590},{218,590}},color={0,0,127}));
    connect(TDis.y, zonOutAirSet.TDis) annotation (Line(points={{241,370},{252,
            370},{252,414},{200,414},{200,587},{218,587}},
                                                      color={0,0,127}));
    connect(VDis_flow.y, zonOutAirSet.VDis_flow) annotation (Line(points={{241,330},
            {260,330},{260,420},{194,420},{194,584},{218,584}}, color={0,0,127}));
    connect(TZonResReq.y, conAHU.uZonTemResReq) annotation (Line(points={{322,370},
            {330,370},{330,526.222},{336,526.222}}, color={255,127,0}));
    connect(PZonResReq.y, conAHU.uZonPreResReq) annotation (Line(points={{322,330},
            {326,330},{326,520.889},{336,520.889}}, color={255,127,0}));
    connect(TOut.y, conAHU.TOut) annotation (Line(points={{-279,180},{-260,180},
            {-260,625.778},{336,625.778}},
                                     color={0,0,127}));
    connect(dpDisSupFan.p_rel, conAHU.ducStaPre) annotation (Line(points={{311,0},
            {160,0},{160,620.444},{336,620.444}}, color={0,0,127}));
    connect(TSup.T, conAHU.TSup) annotation (Line(points={{340,-29},{340,-20},{
            152,-20},{152,567.111},{336,567.111}},
                                               color={0,0,127}));
    connect(TRet.T, conAHU.TOutCut) annotation (Line(points={{100,151},{100,
            561.778},{336,561.778}},
                            color={0,0,127}));
    connect(VOut1.V_flow, conAHU.VOut_flow) annotation (Line(points={{-61,-20.9},
            {-61,545.778},{336,545.778}},color={0,0,127}));
    connect(TMix.T, conAHU.TMix) annotation (Line(points={{40,-29},{40,538.667},
            {336,538.667}},
                       color={0,0,127}));
    connect(conAHU.yOutDamPos, eco.yOut) annotation (Line(points={{424,522.667},
            {448,522.667},{448,36},{-10,36},{-10,-34}},
                                                   color={0,0,127}));
    connect(conAHU.yRetDamPos, eco.yRet) annotation (Line(points={{424,533.333},
            {442,533.333},{442,40},{-16.8,40},{-16.8,-34}},
                                                       color={0,0,127}));
    connect(conAHU.yCoo, gaiCooCoi.u) annotation (Line(points={{424,544},{452,544},
            {452,-274},{88,-274},{88,-248},{98,-248}}, color={0,0,127}));
    connect(conAHU.yHea, swiFreSta.u3) annotation (Line(points={{424,554.667},{
            458,554.667},{458,-280},{40,-280},{40,-200},{58,-200}},
                                                                color={0,0,127}));
    connect(conAHU.ySupFanSpe, fanSup.y) annotation (Line(points={{424,618.667},
            {432,618.667},{432,-14},{310,-14},{310,-28}},
                                                     color={0,0,127}));
    connect(cor.y_actual,conVAVCor.yDam_actual)  annotation (Line(points={{612,58},
            {620,58},{620,74},{518,74},{518,38},{528,38}}, color={0,0,127}));
    connect(sou.y_actual,conVAVSou.yDam_actual)  annotation (Line(points={{792,56},
            {800,56},{800,76},{684,76},{684,36},{698,36}}, color={0,0,127}));
    connect(nor.y_actual,conVAVNor.yDam_actual)  annotation (Line(points={{944,58},
            {846,58},{846,38},{852,38}},                            color={0,0,
            127}));

    connect(warCooTim.y, zonSta.cooDowTim) annotation (Line(points={{-278,380},{-240,
            380},{-240,290},{-222,290}}, color={0,0,127}));
    connect(warCooTim.y, zonSta.warUpTim) annotation (Line(points={{-278,380},{-240,
            380},{-240,286},{-222,286}}, color={0,0,127}));
    connect(flo.TRooAir, zonSta.TZon) annotation (Line(points={{915.13,504},{
            1164,504},{1164,662},{-250,662},{-250,274},{-222,274}},      color={0,
            0,127}));
    connect(zonSta.yCooTim, zonGroSta.uCooTim) annotation (Line(points={{-198,295},
            {-176,295},{-176,291},{-162,291}}, color={0,0,127}));
    connect(zonSta.yWarTim, zonGroSta.uWarTim) annotation (Line(points={{-198,293},
            {-178,293},{-178,289},{-162,289}}, color={0,0,127}));
    connect(zonSta.yOccHeaHig, zonGroSta.uOccHeaHig) annotation (Line(points={{-198,
            288},{-180,288},{-180,285},{-162,285}}, color={255,0,255}));
    connect(zonSta.yHigOccCoo, zonGroSta.uHigOccCoo)
      annotation (Line(points={{-198,283},{-162,283}}, color={255,0,255}));
    connect(zonSta.THeaSetOff, zonGroSta.THeaSetOff) annotation (Line(points={{-198,
            280},{-182,280},{-182,277},{-162,277}}, color={0,0,127}));
    connect(zonSta.yUnoHeaHig, zonGroSta.uUnoHeaHig) annotation (Line(points={{-198,
            278},{-188,278},{-188,279},{-162,279}}, color={255,0,255}));
    connect(zonSta.yEndSetBac, zonGroSta.uEndSetBac) annotation (Line(points={{-198,
            276},{-188,276},{-188,275},{-162,275}}, color={255,0,255}));
    connect(zonSta.TCooSetOff, zonGroSta.TCooSetOff) annotation (Line(points={{-198,
            273},{-190,273},{-190,269},{-162,269}}, color={0,0,127}));
    connect(zonSta.yHigUnoCoo, zonGroSta.uHigUnoCoo)
      annotation (Line(points={{-198,271},{-162,271}}, color={255,0,255}));
    connect(zonSta.yEndSetUp, zonGroSta.uEndSetUp) annotation (Line(points={{-198,
            269},{-192,269},{-192,267},{-162,267}}, color={255,0,255}));
    connect(flo.TRooAir, zonGroSta.TZon) annotation (Line(points={{915.13,504},
            {1164,504},{1164,662},{-250,662},{-250,263},{-162,263}},
          color={0,0,127}));
    connect(falSta.y, zonGroSta.uWin) annotation (Line(points={{-278,340},{-172,
            340},{-172,261},{-162,261}}, color={255,0,255}));
    connect(occSch.tNexOcc, reaRep.u) annotation (Line(points={{-297,-204},{-236,
            -204},{-236,-180},{-202,-180}}, color={0,0,127}));
    connect(reaRep.y, zonGroSta.tNexOcc) annotation (Line(points={{-178,-180},{-164,
            -180},{-164,295},{-162,295}}, color={0,0,127}));
    connect(occSch.occupied, booRep.u) annotation (Line(points={{-297,-216},{-220,
            -216},{-220,-140},{-202,-140}}, color={255,0,255}));
    connect(booRep.y, zonGroSta.uOcc) annotation (Line(points={{-178,-140},{-166,
            -140},{-166,297},{-162,297}}, color={255,0,255}));
    connect(falSta.y, zonGroSta.zonOcc) annotation (Line(points={{-278,340},{-172,
            340},{-172,299},{-162,299}}, color={255,0,255}));
    connect(zonGroSta.uGroOcc, opeModSel.uOcc) annotation (Line(points={{-138,299},
            {-136,299},{-136,314},{-102,314}}, color={255,0,255}));
    connect(zonGroSta.nexOcc, opeModSel.tNexOcc) annotation (Line(points={{-138,
            297},{-134,297},{-134,312},{-102,312}}, color={0,0,127}));
    connect(zonGroSta.yCooTim, opeModSel.maxCooDowTim) annotation (Line(points={{
            -138,293},{-132,293},{-132,310},{-102,310}}, color={0,0,127}));
    connect(zonGroSta.yWarTim, opeModSel.maxWarUpTim) annotation (Line(points={{-138,
            291},{-128,291},{-128,306},{-102,306}}, color={0,0,127}));
    connect(zonGroSta.yOccHeaHig, opeModSel.uOccHeaHig) annotation (Line(points={
            {-138,287},{-126,287},{-126,304},{-102,304}}, color={255,0,255}));
    connect(zonGroSta.yHigOccCoo, opeModSel.uHigOccCoo) annotation (Line(points={
            {-138,285},{-130,285},{-130,308},{-102,308}}, color={255,0,255}));
    connect(zonGroSta.yColZon, opeModSel.totColZon) annotation (Line(points={{-138,
            282},{-122,282},{-122,300},{-102,300}}, color={255,127,0}));
    connect(zonGroSta.ySetBac, opeModSel.uSetBac) annotation (Line(points={{-138,280},
            {-120,280},{-120,298},{-102,298}},      color={255,0,255}));
    connect(zonGroSta.yEndSetBac, opeModSel.uEndSetBac) annotation (Line(points={{-138,
            278},{-118,278},{-118,296},{-102,296}},       color={255,0,255}));
    connect(zonGroSta.TZonMax, opeModSel.TZonMax) annotation (Line(points={{-138,267},
            {-116,267},{-116,294},{-102,294}},      color={0,0,127}));
    connect(zonGroSta.TZonMin, opeModSel.TZonMin) annotation (Line(points={{-138,265},
            {-114,265},{-114,292},{-102,292}},      color={0,0,127}));
    connect(zonGroSta.yHotZon, opeModSel.totHotZon) annotation (Line(points={{-138,
            275},{-112,275},{-112,290},{-102,290}}, color={255,127,0}));
    connect(zonGroSta.ySetUp, opeModSel.uSetUp) annotation (Line(points={{-138,273},
            {-110,273},{-110,288},{-102,288}},      color={255,0,255}));
    connect(zonGroSta.yEndSetUp, opeModSel.uEndSetUp) annotation (Line(points={{-138,
            271},{-108,271},{-108,286},{-102,286}}, color={255,0,255}));
    connect(zonSta.THeaSetOn, TZonSet.TZonHeaSetOcc) annotation (Line(points={{
            -198,290},{-186,290},{-186,198},{-102,198}}, color={0,0,127}));
    connect(zonSta.THeaSetOff, TZonSet.TZonHeaSetUno) annotation (Line(points={{
            -198,280},{-182,280},{-182,196},{-102,196}}, color={0,0,127}));
    connect(zonSta.TCooSetOn, TZonSet.TZonCooSetOcc) annotation (Line(points={{
            -198,285},{-184,285},{-184,203},{-102,203}}, color={0,0,127}));
    connect(zonSta.TCooSetOff, TZonSet.TZonCooSetUno) annotation (Line(points={{
            -198,273},{-190,273},{-190,201},{-102,201}}, color={0,0,127}));
    connect(demLimLev.y, TZonSet.uCooDemLimLev) annotation (Line(points={{-278,
            240},{-220,240},{-220,188},{-102,188}}, color={255,127,0}));
    connect(demLimLev.y, TZonSet.uHeaDemLimLev) annotation (Line(points={{-278,
            240},{-220,240},{-220,186},{-102,186}}, color={255,127,0}));
    connect(opeModSel.yOpeMod, conVAVCor.uOpeMod) annotation (Line(points={{-78,
            300},{-18,300},{-18,76},{504,76},{504,32},{528,32}}, color={255,127,0}));
    connect(opeModSel.yOpeMod, conVAVSou.uOpeMod) annotation (Line(points={{-78,
            300},{-18,300},{-18,76},{676,76},{676,30},{698,30}}, color={255,127,0}));
    connect(opeModSel.yOpeMod, conVAVNor.uOpeMod) annotation (Line(points={{-78,300},
            {-206,300},{-206,70},{832,70},{832,32},{852,32}},       color={255,
            127,0}));

    connect(opeModSel.yOpeMod, conAHU.uOpeMod) annotation (Line(points={{-78,300},
            {-18,300},{-18,531.556},{336,531.556}}, color={255,127,0}));
    connect(TZonSet[1].TZonHeaSet, conAHU.TZonHeaSet) annotation (Line(points={{-78,194},
            {-36,194},{-36,636.444},{336,636.444}},          color={0,0,127}));
    connect(TZonSet[1].TZonCooSet, conAHU.TZonCooSet) annotation (Line(points={{-78,202},
            {-26,202},{-26,631.111},{336,631.111}},          color={0,0,127}));
    connect(TZonSet[1].TZonHeaSet, conVAVCor.TZonHeaSet) annotation (Line(points={{-78,194},
            {482,194},{482,52},{528,52}},            color={0,0,127}));
    connect(TZonSet[2].TZonHeaSet, conVAVSou.TZonHeaSet) annotation (Line(points={{-78,194},
            {672,194},{672,50},{698,50}},            color={0,0,127}));
    connect(TZonSet[3].TZonHeaSet, conVAVNor.TZonHeaSet) annotation (Line(points={{-78,194},
            {1016,194},{1016,52},{852,52}},             color={0,0,127}));
    connect(TZonSet[1].TZonCooSet, conVAVCor.TZonCooSet) annotation (Line(points={{-78,202},
            {476,202},{476,50},{528,50}},            color={0,0,127}));
    connect(TZonSet[2].TZonCooSet, conVAVSou.TZonCooSet) annotation (Line(points={{-78,202},
            {666,202},{666,48},{698,48}},            color={0,0,127}));
    connect(TZonSet[3].TZonCooSet, conVAVNor.TZonCooSet) annotation (Line(points={{-78,202},
            {828,202},{828,50},{852,50}},               color={0,0,127}));
    connect(opeModSel.yOpeMod, intRep.u) annotation (Line(points={{-78,300},{-18,
            300},{-18,250},{-160,250},{-160,230},{-142,230}}, color={255,127,0}));
    connect(intRep.y, TZonSet.uOpeMod) annotation (Line(points={{-118,230},{-110,
            230},{-110,207},{-102,207}}, color={255,127,0}));
    connect(zonGroSta.yOpeWin, opeModSel.uOpeWin) annotation (Line(points={{-138,261},
            {-124,261},{-124,302},{-102,302}}, color={255,127,0}));

    connect(TRooAir.y3[1], conVAVCor.TZon) annotation (Line(
        points={{511,163},{560,163},{560,42},{528,42}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(conVAVSou.TZon, TRooAir.y1[1]) annotation (Line(
        points={{698,40},{654,40},{654,177},{511,177}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(conVAVNor.TZon, TRooAir.y2[1]) annotation (Line(
        points={{852,42},{840,42},{840,132},{511,132},{511,170}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(TSupNor.T, TDis.u3[1]) annotation (Line(points={{899,90},{182,90},{
            182,363},{218,363}}, color={0,0,127}));
    connect(VSupNor_flow.V_flow, VDis_flow.u3[1]) annotation (Line(points={{901,156},
            {184.5,156},{184.5,323},{218,323}},      color={0,0,127}));
    annotation (experiment(
        StopTime=86400,
        __Dymola_NumberOfIntervals=1440,
        Tolerance=1e-06,
        __Dymola_Algorithm="Dassl"));
  end Guideline36_3zones;
  annotation (Icon(graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,60},{64,0},{-36,-60},{-36,60}})}));
end Examples;
