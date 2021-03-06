<%@page import="com.cabletech.watchinfo.beans.*"%>
<jsp:useBean id="watchBean" class="com.cabletech.watchinfo.beans.WatchBean" scope="request"/>
<jsp:useBean id="sublineBean" class="com.cabletech.baseinfo.beans.SublineBean" scope="request"/>
<%@page import="com.cabletech.baseinfo.domainobjects.UserInfo"%>
<%@include file="/common/header.jsp"%>
<%
  String lineid = watchBean.getLid(); //所属线路
  String conStr = "pointid in (select p.pointid pointid from sublineinfo s,pointinfo p where p.sublineid = s.sublineid and	s.sublineid = '" + lineid + "')";
  String gisweb = (String)request.getAttribute("gisweb");
  String regionID = request.getParameter("regionID");
%>
<script language="javascript" type="">
<!--

var iteName = "";

function getTimeWin(objName){

    iteName = objName;

    showx = event.screenX - event.offsetX - 4 - 210 ;
    showy = event.screenY - event.offsetY + 18;

    var timeWin = window.showModalDialog("${ctx}/common/time.html",self, "dialogWidth:255px; dialogHeight:285px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no;help:no");

}

function setSelecteTime(time) {
    document.all.item(iteName).value = time;
}

function toLoadPoint(){

    opSelect(true);

    var desPage = "${ctx}/pointAction.do?method=loadPoint4Watch&id=" + watchBean.lid.value;
    //alert(desPage);

    hiddenFrame.location.replace(desPage);

}

function opSelect(flag){

    watchBean.startpointid.disabled = flag;
    watchBean.endpointid.disabled = flag;

}

function toSetVis(visStr){

    for(var i = 0; i < toHideTr.length; i ++){

        toHideTr[i].style.display = visStr;
    }

}

function isPosInteger(inputVal) {
var oneChar
    inputStr=inputVal.toString()
    for (var i=0;i<inputStr.length;i++) {
        oneChar=inputStr.charAt(i)
        if (oneChar<"0" || oneChar>"9") {
            return false
        }
    }
    return true
}


function isValidForm() {
  var btime = watchBean.orderlyBeginTime.value;
    var etime = watchBean.orderlyEndTime.value;
    var b = btime.substring(0,2);
    var e = etime.substring(0,2);
    var s = Math.abs(e-b);
    if( b > e ){
      s = 24-s;
    }
        //结束日期必须大于等于开始日期
    var yb = watchBean.beginDate.value.substring(0,4);
    var mb = parseInt(watchBean.beginDate.value.substring(5,7) ,10) - 1;
    var db = parseInt(watchBean.beginDate.value.substring(8,10),10);
    var bdate = new Date(yb,mb,db);

    var ye = watchBean.endDate.value.substring(0,4);
    var me = parseInt(watchBean.endDate.value.substring(5,7) ,10) - 1;
    var de = parseInt(watchBean.endDate.value.substring(8,10),10);
    var edate = new Date(ye,me,de);
    if(edate < bdate){
      alert("结束日期不能小于开始日期!");
      return false;
    }
    //结束时间必须大于等于开始时间
    //var hb = parseInt(watchBean.orderlyBeginTime.value.substring(0,2),10) +  parseInt(watchBean.error.value,10);
    var hb = parseInt(watchBean.orderlyBeginTime.value.substring(0,2),10);
	var mb = parseInt(watchBean.orderlyBeginTime.value.substring(3,5) ,10) ;
    var sb = parseInt(watchBean.orderlyBeginTime.value.substring(6,8),10);
    var db = new Date();
    db.setHours(hb, mb, sb);
    var he = parseInt(watchBean.orderlyEndTime.value.substring(0,2),10);
    var me = parseInt(watchBean.orderlyEndTime.value.substring(3,5) ,10);
    var se = parseInt(watchBean.orderlyEndTime.value.substring(6,8),10);
    var de = new Date();
    de.setHours(he, me, se);
    if(de < db){
        alert("值班结束日期不能小于开始日期!");
        return false;
    }




    if(watchBean.placeName.value==""){
        alert("名称不能为空! ");
        watchBean.placeName.focus();
        return false;
    }


    if (isNaN(watchBean.watchwidth.value)){
        alert("盯防范围应该为数字型! ");
        watchBean.watchwidth.focus();
        return false;
    }

	if(parseInt(watchBean.watchwidth.value) > 300){
        alert("盯防范围不能超过300米! ");
        watchBean.watchwidth.focus();
        return false;
    }

    if(watchBean.principal.value==""){
        alert("盯防负责人/组不能为空! ");
        watchBean.principal.focus();
        return false;
    }

    if(watchBean.beginDate.value==""){
        alert("盯防开始日期不能为空! ");
        watchBean.beginDate.focus();
        return false;
    }

	// 取得系统日期
	var d = new Date();
	var s = '';
	s += d.getYear() + "/"; 
    if((d.getMonth() + 1) > 9) {
		s += (d.getMonth() + 1) + "/";            // 获取月份。
	} else {
		s += "0" + (d.getMonth() + 1) + "/";            // 获取月份。
	}	
   	// 获取日。
	if(d.getDate() > 9) {
		s += d.getDate();
	 } else {
		s = s + "0" + d.getDate()
	 }
	 if(s > watchBean.beginDate.value) {
		alert("开始日期不能小于当前日期!");
		return false;
	 } 


    if(watchBean.patrolTime.value==""){
        alert("盯防开始时间不能为空! ");
        watchBean.patrolTime.focus();
        return false;
    }
    if(watchBean.orderlyBeginTime.value==""){
        alert("值班开始时间不能为空! ");
        watchBean.orderlyBeginTime.focus();
        return false;
    }
    if(watchBean.orderlyEndTime.value==""){
        alert("值班结束时间不能为空! ");
        watchBean.orderlyEndTime.focus();
        return false;
    }

    if(watchBean.error.value==""){
        alert("值班时间间隔不能为空! ");
        watchBean.error.focus();
        return false;
    }
    if (isNaN(watchBean.error.value)){
        alert("值班时间间隔应该为数字型! ");
        watchBean.error.focus();
        return false;
    }
    if(!isPosInteger(watchBean.error.value)){
      alert("值班时间间隔只能是整数!");
      watchBean.error.focus();
      return false;
    }
    if(watchBean.error.value > s){
      alert("信息发送间隔不能大于值班时间");
      watchBean.error.focus();
      return false;
    }
        if(watchBean.involvedsegmentlist.value == ""){
      alert("受影响光缆不能为空");
      watchBean.error.focus();
      return false;
    }
        if(watchBean.involvedlinenumber.value == ""){
      alert("受影响光缆数不能为空");
      watchBean.error.focus();
      return false;
    }
    return true;
}

function toClearEndDate(){
    watchBean.endDate.value = "待定";
}

function preSetEndDate(){
    if(watchBean.endDate.value == ""){
        watchBean.endDate.value = "待定";
    }
}

function loadForm(){
    var url = "${ctx}/watchAction.do?method=loadWatchAsObj&id=" + watchBean.placeID.value;
    self.location.replace(url);
}

function RedirectPage(){
    var url = "${ctx}/watchAction.do?method=queryWatch";
    self.location.replace(url);
}

function toGetBack(){
        var url = "${ctx}/watchAction.do?method=queryWatch";
        self.location.replace(url);
}

function countNum(){
  //alert(watchBean.involvedsegmentlist.value);
  if(watchBean.involvedlinenumber.value!=watchBean.involvedsegmentlist.length){
    if(watchBean.involvedsegmentlist.length==undefined){
      if(watchBean.involvedsegmentlist.value=="null"){
        watchBean.involvedlinenumber.value = 0;
      }else{
        watchBean.involvedlinenumber.value = 1;
      }
    }else{
      watchBean.involvedlinenumber.value = watchBean.involvedsegmentlist.length;
    }
  }
}

function toEditCable(fID) {
    //fID 1,增加 2,修改;
    var pageName = "${ctx}/WatchManage/getWatchRelativeCable4GIS.jsp?fID="+fID+"&regionID=<%=regionID%>";

    var pointsPop = window.open(pageName,'pointsPop','width=400,height=300,scrollbars=yes');
    //,resizable=yes,,status=yes
    pointsPop.focus();
}

//-->
</script>

<%if(gisweb!=null){%><template:titile value="修改外力盯防现场信息       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ <a href=javascript:loadForm()>基础信息表格模式</a> ]"/>
<%}else{%><template:titile value="修改外力盯防现场信息"/><%}%>
<html:form onsubmit="return isValidForm()" method="Post" action="/watchAction.do?method=updateWatch">
  <template:formTable contentwidth="250" namewidth="250">
    <template:formTr name="盯防名称" isOdd="false">
     
      <bean:write name="watchBean" property="placeName" />
      <html:hidden property="placeName"/>
      <html:hidden property="placeID"/>
      <html:hidden property="regionID"/>
      <html:hidden property="dealstatus"/>
    </template:formTr>
  <%
    WatchBean bean = (WatchBean) request.getAttribute("watchBean");
    String sqlcon = "select contractorname from contractorinfo where state is null and contractorid = '" + bean.getContractorid() + "'";
    java.sql.ResultSet rsc = null;
    com.cabletech.commons.hb.QueryUtil util = new com.cabletech.commons.hb.QueryUtil();
    rsc = util.executeQuery(sqlcon);
  %>
    <template:formTr name="代维单位" isOdd="false">
      <html:select property="contractorid" styleClass="inputtext" style="width:160">
      <%while (rsc.next()) {      %>
        <html:option value="<%=bean.getContractorid()%>"><%=rsc.getString(1)%>        </html:option>
      <%}rsc.close();      %>
      </html:select>
    </template:formTr>
  <%
    String sql = "select * from patrolmaninfo where state is null and patrolid = '" + bean.getPrincipal() + "'";
    java.sql.ResultSet rs = null;
    rs = util.executeQuery(sql);
  %>
    <logic:equal value="group"  name="PMType">
            <template:formTr name="盯防负责组">
              <html:select property="principal" styleClass="inputtext" style="width:160">
              <%while (rs.next()) {      %>
                <html:option value="<%=rs.getString(1)%>"><%=rs.getString(2)%>        </html:option>
              <%}rs.close();      %>
              </html:select>
            </template:formTr>
    </logic:equal>
    <logic:notEqual value="group" name="PMType">
                <template:formTr name="盯防负责人">
                  <html:select property="principal" styleClass="inputtext" style="width:160">
                  <%while (rs.next()) {      %>
                    <html:option value="<%=rs.getString(1)%>"><%=rs.getString(2)%>        </html:option>
                  <%}  rs.close();    %>
                  </html:select>
                </template:formTr>
    </logic:notEqual>


    <template:formTr name="所属区域" isOdd="false">
      <html:hidden property="innerregion" />
      <bean:write name="watchBean" property="innerregion" />
    </template:formTr>
    <template:formTr name="工地位置">
      <html:hidden property="watchplace"/>
      <bean:write name="watchBean" property="watchplace" />
    </template:formTr>
 <logic:equal value="show" name="ShowFIB">

    <template:formTr name="工地类型">
      <html:select property="placetype" styleClass="inputtext" style="width:160">
          <html:option value="拆建楼房">拆建楼房</html:option>
          <html:option value="道路改造">道路改造</html:option>
          <html:option value="地铁施工">地铁施工</html:option>
          <html:option value="地下管道修建">地下管道修建</html:option>
          <html:option value="房屋拆建">房屋拆建</html:option>
          <html:option value="公路扩建">公路扩建</html:option>
          <html:option value="光缆承载物质量">光缆承载物质量</html:option>
          <html:option value="基站装修">基站装修</html:option>
      </html:select>
    </template:formTr>
 </logic:equal>
 <logic:notEqual value="show" name="ShowFIB">

    <template:formTr name="工地类型">
      <html:text property="placetype" styleClass="inputtext" style="width:160"  />

      <!--
      <html:select property="placetype" styleClass="inputtext" style="width:160">
          <html:option value="拆建楼房">拆建楼房</html:option>
          <html:option value="道路改造">道路改造</html:option>
          <html:option value="地铁施工">地铁施工</html:option>
          <html:option value="地下管道修建">地下管道修建</html:option>
          <html:option value="房屋拆建">房屋拆建</html:option>
          <html:option value="公路扩建">公路扩建</html:option>
          <html:option value="基站装修">基站装修</html:option>
      </html:select>
      -->
    </template:formTr>
 </logic:notEqual>
    <template:formTr name="盯防级别">
      <html:select property="dangerlevel" styleClass="inputtext" style="width:160">
        <html:option value="紧急">紧急</html:option>
        <html:option value="重要">重要</html:option>
        <html:option value="一般">一般</html:option>
      </html:select>
    </template:formTr>
    <template:formTr name="隐患原因" isOdd="false">
      <html:text property="watchreason" styleClass="inputtext" style="width:160" maxlength="45"/>
    </template:formTr>
    <template:formTr name="经度">  
      <html:hidden property="gpscoordinate" />    
      <bean:write name="watchBean" property="x" />
    </template:formTr>
    <template:formTr name="纬度">      
      <bean:write name="watchBean" property="y" />
    </template:formTr>
    <template:formTr name="盯防半径" isOdd="false">
      <html:text property="watchwidth" styleClass="inputtext" style="width:160"/>
      &nbsp;
      (单位：米)
    </template:formTr>
    <template:formTr name="开始日期" isOdd="false">
      <html:text property="beginDate" styleClass="inputtext" size="25" maxlength="45" readonly="true"/>
      <apptag:date property="beginDate"/>
    </template:formTr>
    <template:formTr name="结束日期">
      <html:text property="endDate" styleClass="inputtext" size="25" maxlength="45" readonly="true"/>
      <apptag:date property="endDate"/>
      &nbsp;&nbsp;
      <input type="button" value="待定" onclick="toClearEndDate()">
    </template:formTr>
    <template:formTr name="计划巡检时间" style="display:none">
      <html:text property="patrolTime" styleClass="inputtext" size="25" maxlength="45" value="2005/01/01"/>
      <apptag:date property="patrolTime"/>
    </template:formTr>
    <template:formTr name="值班开始时间" isOdd="false">
      <html:text property="orderlyBeginTime" styleClass="inputtext" size="25" maxlength="45" readonly="true"/>
      <input type='button' value="▼" id='btn' onclick="getTimeWin('orderlybegintime')" style="font:'normal small-caps 6pt serif';">
    </template:formTr>
    <template:formTr name="值班结束时间">
      <html:text property="orderlyEndTime" styleClass="inputtext" size="25" maxlength="45" readonly="true"/>
      <input type='button' value="▼" id='btn' onclick="getTimeWin('orderlyEndTime')" style="font:'normal small-caps 6pt serif';">
    </template:formTr>
    <template:formTr name="信息发送间隔" isOdd="false">
      <html:text property="error" styleClass="inputtext" size="25" maxlength="45"/>
      &nbsp;
      (单位：小时)
    </template:formTr>
   <logic:equal value="show" name="ShowFIB">
      <template:formTr name="受影响光缆名称">
        <span id = "listSpan"><br>
          <table>
          <%
          //String[][] kidArr = sublineBean.getCablelist();
          String [][] kidArr = (String[][])request.getAttribute("tempArr");
          if( kidArr != null){
            for(int i = 0; i < kidArr.length; i++){
              %>
              <tr>
                <td>
                  <input type= "hidden" name="involvedsegmentlist" value="<%=kidArr[i][0]%>">
                  <input type="text" name ="cablename" value="<%=kidArr[i][1]%>" style = "border:0;background-color:transparent;width:160;font-size:9pt"  readonly>
                </td>
              </tr>
              <%
              }
            } else {%>
            <input type= "hidden" name="involvedsegmentlist" value="null">
            <%}
            %>
            </table>
        </span>
        <br>
        <br>
        <span id="toEditSubListSpan"><a href="javascript:toEditCable(2)">添加编辑受影响光缆</a></span>
      </template:formTr>
    <template:formTr name="受影响光缆总段数" isOdd="false">
      <html:text property="involvedlinenumber" styleClass="inputtext" style="width:160" onclick="countNum()"/>
    </template:formTr>
   </logic:equal>

   <logic:notEqual value="noShow" name="ShowFIB">
   </logic:notEqual>
   <input type="hidden" name="gisweb" value="<%=gisweb%>">
    <template:formSubmit>
    <logic:equal value="show" name="ShowFIB">
      <td>
        <html:submit styleClass="button" onmouseover="countNum()">更新</html:submit>
      </td>
    </logic:equal>
    <logic:notEqual value="show" name="ShowFIB">
      <td>
        <html:submit styleClass="button">更新</html:submit>
      </td>
    </logic:notEqual>
      <td>
      <%if(gisweb!=null){%>
        <input type="button" class="button" onclick="location.replace('<%=session.getAttribute("S_BACK_URL")%>')" value="返回">
      <%}else{%>
        <html:button property="action"styleClass="button"  onclick="self.close()">取消</html:button>
      <%}%>
      </td>
    </template:formSubmit>
  </template:formTable>
</html:form>
<iframe id="hiddenFrame" style="display:none"></iframe>
<script language="javascript" type="">
<!--
preSetEndDate();
//-->
</script>
