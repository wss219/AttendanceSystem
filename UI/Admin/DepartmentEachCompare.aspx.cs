using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;
using Microsoft.Office.Interop.Owc11;


public partial class Admin_DepartmentEachCompare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetDataAndCreateChartBySun();
        }
        if (Session["Role"].ToString() == "")
        {
            Response.Redirect("~\\登录.aspx");
        }
    }

    private void GetDataAndCreateChartBySun()
    {
        DataTable dtCount = AddSQLStringToDAL.GetDataTableBysql("select * from TabDepartmentSum");
        string[] AllCount = new string[dtCount.Rows.Count];
        for (int i = 0; i < dtCount.Rows.Count; i++)
        {
            AllCount[i] = dtCount.Rows[i]["Sum"].ToString();
        }

        string[] AllDepartment = { "会计系","信息工程系","经济管理系","商务外语系","食品工程系","机械工程系","建筑工程系"};
        string[] AllData = new string[AllDepartment.Length];
        string[] AllLate = new string[AllDepartment.Length];
        string[] AllAttendance = new string[AllDepartment.Length];
        string[] AllEarly = new string[AllDepartment.Length];
        string[] AllLeave = new string[AllDepartment.Length];

        for(int i =0;i<AllDepartment.Length;i++)
        {
            DataTable dt = InitialDataTable(AllDepartment[i]);
            AllData[i] = dt.Rows[dt.Rows.Count - 1]["合计"].ToString();  //最后一行
            AllLeave[i] = dt.Rows[dt.Rows.Count - 1]["请假人数"].ToString();
            AllAttendance[i] = dt.Rows[dt.Rows.Count - 1]["旷课人数"].ToString();
            AllEarly[i] = dt.Rows[dt.Rows.Count - 1]["早退人数"].ToString();
            AllLate[i] = dt.Rows[dt.Rows.Count - 1]["迟到人数"].ToString();
        }

        DataTable dt111 = DataAnalysis.CreateDataTableReplaceChart(AllDepartment, AllCount, AllAttendance, AllLate, AllEarly, AllLeave, AllData);
        string[] AllDataRate = new string[AllDepartment.Length];
        string[] AllAttendanceRate = new string[AllDepartment.Length];
        string[] AllLeaveRate = new string[AllDepartment.Length];
        string[] AllLateRate = new string[AllDepartment.Length];
        string[] AllEarlyRate = new string[AllDepartment.Length];
        for (int i = 0; i < dt111.Rows.Count; i++)
        {
            AllDataRate[i] = dt111.Rows[i]["总缺勤率"].ToString();
            AllAttendanceRate[i] = dt111.Rows[i]["旷课率"].ToString();
            AllLeaveRate[i] = dt111.Rows[i]["请假率"].ToString();
            AllLateRate[i] = dt111.Rows[i]["迟到率"].ToString();
            AllEarlyRate[i] = dt111.Rows[i]["早退率"].ToString();
        }

        GridView1.DataSource = dt111;
        GridView1.DataBind();

        if (Session["CurrentWeek"].ToString() == "01")
        {
            string s1 = DrawChart("总缺勤率", AllDepartment, AllDataRate, Session["CurrentWeek"].ToString());
            this.phDepartmentEachCompare.Controls.Add(new LiteralControl(s1));
            string s2 = DrawChart("旷课率", AllDepartment, AllAttendanceRate, Session["CurrentWeek"].ToString());
            this.phAttendance.Controls.Add(new LiteralControl(s2));
            string s3 = DrawChart("请假率", AllDepartment, AllLeaveRate, Session["CurrentWeek"].ToString());
            this.phLeave.Controls.Add(new LiteralControl(s3));
            string s4 = DrawChart("迟到率", AllDepartment, AllLateRate, Session["CurrentWeek"].ToString());
            this.phLate.Controls.Add(new LiteralControl(s4));
            string s5 = DrawChart("早退率", AllDepartment, AllEarlyRate, Session["CurrentWeek"].ToString());
            this.phEarly.Controls.Add(new LiteralControl(s5));
        }
        else 
        {
            string s1 = DrawChart("总缺勤率", AllDepartment, AllDataRate, "01-" + Session["CurrentWeek"].ToString());
            this.phDepartmentEachCompare.Controls.Add(new LiteralControl(s1));
            string s2 = DrawChart("旷课率", AllDepartment, AllAttendanceRate, "01-" + Session["CurrentWeek"].ToString());
            this.phAttendance.Controls.Add(new LiteralControl(s2));
            string s3 = DrawChart("请假率", AllDepartment, AllLeaveRate, "01-" + Session["CurrentWeek"].ToString());
            this.phLeave.Controls.Add(new LiteralControl(s3));
            string s4 = DrawChart("迟到率", AllDepartment, AllLateRate, "01-" + Session["CurrentWeek"].ToString());
            this.phLate.Controls.Add(new LiteralControl(s4));
            string s5 = DrawChart("早退率", AllDepartment, AllEarlyRate, "01-" + Session["CurrentWeek"].ToString());
            this.phEarly.Controls.Add(new LiteralControl(s5));
        }
    }

    private DataTable InitialDataTable(string Department)
    {
        DataTable dt = DataAnalysis.CreateDataTable();
        string cWeek = Session["CurrentWeek"].ToString();
        for (int i = Convert.ToInt32(cWeek); i > 0; i--)
        {
            string str1 = i.ToString();
            if (str1.Length == 1)
            {
                str1 = "0" + str1;  //周次
            }
            int Late = DataAnalysis.GetEveryAttendanceNumber(Department, str1, "迟到");
            int Early = DataAnalysis.GetEveryAttendanceNumber(Department, str1, "早退");
            int Attandance = DataAnalysis.GetEveryAttendanceNumber(Department, str1, "旷课");
            int Leave = DataAnalysis.GetEveryAttendanceNumber(Department, str1, "请假");

            DataRow dr = DataAnalysis.CreatDataRow(dt, str1, Department, Late, Early, Attandance, Leave);
            dt.Rows.Add(dr);
        }

        DataRow drLast = DataAnalysis.InsertLastRow(dt);
        dt.Rows.Add(drLast);
        return dt;
    }

    protected string DrawChart(string DrawType, string[] AllDepartment, string[] AllDataRote, string Range)
    {
        string strXdata = string.Empty;
        for (int i = 0; i < AllDepartment.Length; i++)
        {
            strXdata += AllDepartment[i] + "\r" + DrawType + AllDataRote[i] + "\t";
        }
        string strYdata = string.Empty;
        foreach (string strValue in AllDataRote)
        {
            strYdata += strValue + "\t";
        }

        ChartSpace laySpace = new ChartSpace();
        ChChart InsertChart = laySpace.Charts.Add(0);

        InsertChart.Type = ChartChartTypeEnum.chChartTypeColumnClustered;
        InsertChart.HasLegend = false;

        InsertChart.HasTitle = true;
        InsertChart.Title.Caption = "第" + Range + "周各系部学生【" + DrawType + "】对比图";

        InsertChart.Axes[0].HasTitle = true;
        InsertChart.Axes[0].Title.Caption = "系部";
        InsertChart.Axes[1].HasTitle = true;
        InsertChart.Axes[1].Title.Caption = DrawType;

        InsertChart.SeriesCollection.Add(0);
        InsertChart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimSeriesNames, (int)ChartSpecialDataSourcesEnum.chDataLiteral, "图例1");
        InsertChart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimCategories, (int)ChartSpecialDataSourcesEnum.chDataLiteral, strXdata);
        InsertChart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimValues, (int)ChartSpecialDataSourcesEnum.chDataLiteral, strYdata);

        string strAbsolutePath = (Server.MapPath(".")) + "\\" + DrawType + ".gif";
        laySpace.ExportPicture(strAbsolutePath, "GIF", 850, 300);

        string strRelativePath = "./" + DrawType + ".gif";
        Random rd = new Random();
        string strImageTag = "<IMG SRC='" + strRelativePath + "?id=" + rd.Next(65500) + "'>";
        string url = "DepartmentEachCompare.aspx?ImageUrl=" + strImageTag;
        return strImageTag;
    }

}