
<%@ page import="java.util.List,java.util.Iterator,Employee.EmpDAO" %>
<jsp:useBean id="doBean" class="Employee.EmpDAO"  scope="session"/>
<table id="tableX">
    <tr><td><button onclick="insert()">Insert</button></td></tr>
    <tr><td><button onclick="update()">Update</button></td></tr>
    <tr><td><button onclick="del()">Delete</button></td></tr>
    <tr><td><button onclick="display()">Display</button></td></tr>
</table>
<div id ="inserting">
    
</div>
<div id="operations"></div>
<script>
    function insert(){
        document.getElementById("inserting").innerHTML = "Please Enter Details:-";
        tabl = document.createElement("table");
        form = document.createElement("form");
        //form.action="index.jsp";
        form.method="post";
        tabl.setAttribute("id","insertTable");
        var inst = document.getElementById("inserting");
        var tr = tabl.insertRow();
        var td = tr.insertCell();
        var id = document.createElement("input");
        id.type='text';
        id.name='id';
        id.value = 'id';
        td.appendChild(id);
        td = tr.insertCell();
        var name = document.createElement("input");
        name.type='text';
        name.name='name';
        name.value = 'name';
        td.appendChild(name);
        td = tr.insertCell();
        var salary = document.createElement("input");
        salary.type='text';
        salary.name='salary';
        salary.value = 'salary';
        td.appendChild(salary);
        td = tr.insertCell();
        var gender = document.createElement("input");
        gender.type='text';
        gender.name='gender';
        gender.value = 'gender';
        td.appendChild(gender);
        var submit = document.createElement("input");
        submit.type='submit';
        submit.name='submit';
        submit.value='submit';
        form.appendChild(tabl);
        form.appendChild(submit);
        var instChildren =inst.childNodes;
        if(instChildren[0]){
        inst.replaceChild(form,instChildren[0]);
    }
        else
            inst.appendChild(form);
    };
</script>    
    <%
        //insertion
        String i = request.getParameter("id");
       String n = request.getParameter("name");
       String s = request.getParameter("salary");
       String g = request.getParameter("gender");
        if(request.getParameter("submit")!=null){
      
       
       if(i==null||s==null||n==null||g==null){
           
       }
       else{
       int id = Integer.parseInt(i);
       double sal = Double.parseDouble(s);
       doBean.setEmpGender(g);
       doBean.setEmpID(id);
       doBean.setEmpSalary(sal);
       doBean.setEmpName(n);
       if(doBean.insert()){
           out.println("Employee "+n+" Inserted...");
       }
       else
            out.println("Failed....");
       }
        }
    %>
      <%
        //update
        System.out.println("inside update----------------------------->");
        int id =0;
            i = request.getParameter("UPID");
            System.out.println("I have the Updated ID---------------->"+i);
            if(i!=null){
                id = Integer.parseInt(i);
                doBean = EmpDAO.display(id);
            }
            
            if(doBean.getEmpID()!=0){
            out.println("<form method='post'>");
            out.println("<table>");
            out.println("<tr><td><input type ='text' name ='Uid' value ="+doBean.getEmpID()+ "></tr></td>");
            out.println("<tr><td><input type ='text' name ='Uname' value ="+doBean.getEmpName()+ "></tr></td>");
            out.println("<tr><td><input type ='text' name ='Usalary' value ="+doBean.getEmpSalary()+ "></tr></td>");
            out.println("<tr><td><input type ='text' name ='Ugender' value ="+doBean.getEmpGender()+ "></tr></td>");
            out.println("<tr><td><input type='submit' value='update'></tr></td>");
            out.println("</table>");
            }
          
    %>
       <script>
            //update() function script...
            function update(){
            var op= document.getElementById("operations");
            var uform = document.createElement('form');
            uform.method='post';
            var textFil= document.createElement('input');
            textFil.name='UPID';
            textFil.type='text';
            var sub = document.createElement('input');
            sub.type='submit';
            sub.value='UPDATE';
            uform.appendChild(textFil);
            uform.appendChild(sub);
            var opChildren = op.childNodes;
            if(opChildren[0]){
                op.replaceChild(uform,opChildren[0]);
            }
            else
                op.appendChild(uform);
            
        };
        </script>    
    <%
        //update
       
                System.out.println("doBean Values------------->"+doBean.getEmpID());
                    i = request.getParameter("Uid");
                    s = request.getParameter("Usalary");
                    n = request.getParameter("Uname");
                    g = request.getParameter("Ugender");
                    if(i!=null||s!=null||n!=null||g!=null){
                    int uid = Integer.parseInt(i);
                    double ds = Double.parseDouble(s);
                    
                    doBean.setEmpID(uid);
                    doBean.setEmpGender(g);
                    doBean.setEmpName(n);
                    doBean.setEmpSalary(ds);
                    System.out.println("Im here now------------------->>");
                    doBean.update(id);
                    }
                       
    %>
    
    