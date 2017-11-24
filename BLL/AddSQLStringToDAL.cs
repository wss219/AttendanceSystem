using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;

namespace BLL
{
   public class AddSQLStringToDAL
    {
       public static DataTable GetDataTableBysql(string strsql)
       {
           return ConnHelper.GetDataTable(strsql);
       }

       public static void Insert(string BiaoMing,string Type, string Department, string UserID, string UserName, string UserPWD, string Role)//新增教师，插入数据
       {
           ConnHelper.ZSGC("insert into "+BiaoMing+"(Type,Department,UserID,UserName,UserPWD,Role) values('"+Type.Trim()+"','"+Department.Trim()+"','"+UserID.Trim()+"','"+UserName.Trim()+"','"+UserPWD.Trim()+"','"+Role.Trim()+"')");
       }

       public static DataTable GetDistinctColums(string BiaoMing,string LieMing)//获取不同行
       {
           DataTable dt=ConnHelper.GetDataTable("select distinct "+LieMing+" from "+BiaoMing+"");
           return dt;
       }

       public static List<string> GetDistinctStrings(string strTable, string str1)
       {
           string strSQL = "select distinct '" + str1 + "' from " + strTable + " ";
           return ConnHelper.GetDistinceColoum(strSQL, str1);
       }

       public static void Update(string BiaoMing,string WantUpdateLieMing,string WantValue,string LieMing,string value1)
       {
           ConnHelper.ZSGC("update "+BiaoMing+" set "+WantUpdateLieMing+" = '"+WantValue.Trim()+"' where "+LieMing+" = '"+value1.Trim()+"'");
       }

       public static void Update(string strsql)
       {
           ConnHelper.ZSGC(strsql);
       }

       public static void Delete(string UserID,string BiaoMing)
       {
           ConnHelper.ZSGC("delete * from "+BiaoMing+" where UserID = '"+UserID+"'");
       }

       public static bool UpdateTabTeachers(string TableName, string UserPWD, string UserID)
       {
           string strSQL = BuildSQLUpdateString(TableName, UserPWD, UserID);
           return ConnHelper.ExecuteNoneQueryOperation(strSQL);
       }

       public static string BuildSQLUpdateString(string strTableName, string UserPWD, string UserID)
       {
           return "update "+strTableName+" set UserPWD = '"+UserPWD+"' where UserID = '"+UserID+"'";
       }
    }
}
