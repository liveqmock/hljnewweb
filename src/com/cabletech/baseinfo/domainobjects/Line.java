package com.cabletech.baseinfo.domainobjects;

import com.cabletech.commons.base.*;

public class Line extends BaseBean{

    private String lineID;
    private String lineName;
    private String ruleDeptID;
    private String lineType;
    private String state;
    private String regionid;
    private String remark;
    public Line(){
    }


    public String getLineID(){
        return lineID;
    }


    public void setLineID( String lineID ){
        this.lineID = lineID;
    }


    public String getLineName(){
        return lineName;
    }


    public void setLineName( String lineName ){
        this.lineName = lineName;
    }


    public String getRuleDeptID(){
        return ruleDeptID;
    }


    public void setRuleDeptID( String ruleDeptID ){
        this.ruleDeptID = ruleDeptID;
    }


    public String getLineType(){
        return lineType;
    }


    public void setLineType( String lineType ){
        this.lineType = lineType;
    }


    public String getState(){
        return state;
    }


    public void setState( String state ){
        this.state = state;
    }


    public String getRegionid(){
        return regionid;
    }


    public String getRemark(){
        return remark;
    }


    public void setRegionid( String regionid ){
        this.regionid = regionid;
    }


    public void setRemark( String remark ){
        this.remark = remark;
    }
}
