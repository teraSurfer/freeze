
<%@ page import="java.util.List,java.util.Iterator,Employee.EmpDAO" %>
<jsp:useBean id="doBean" class="Employee.EmpDAO"  scope="request"/>
<table id="tableX">
    <tr><td><button onclick="insert()">Insert</button></td></tr>
    <tr><td><button onclick="update()">Update</button></td></tr>
    <tr><td><button onclick="del()">Delete</button></td></tr>
    <tr><td><button onclick="display()">Display</button></td></tr>
</table>
<div id ="inserting">
    
</div>
<div id="operations"></div>
<div id = "result"></div>
<script>
    function insert(){
        document.getElementById("inserting").innerHTML = "Please Enter Details:-";
        tabl = document.createElement("table");
        form = document.createElement("form");
        //form.action="index.jsp";
        form.method="post";
        tabl.setAttribute("id","insertTable");
        var inst = document.getElementById("inserting");
        var op = document.getElementById("operations");
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
        var opChildren =op.childNodes;
        if(opChildren[0]){
        op.replaceChild(form,opChildren[0]);
    }
        else
            op.appendChild(form);
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
           out.println("<script>document.getElementById(\"result\").innerHTML=\"Inserted Emplyoyee:- "+doBean.getEmpName()+"\"</script>");
           doBean.setEmpID(0);
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
            out.println("<div id=\"utabdiv\">");    
            out.println("<form method='post' id = 'updationForm'>");
            out.println("<table>");
            //out.println("<tr><td><input type ='text' name ='Uid' value ="+doBean.getEmpID()+ "></tr></td>");
            out.println("<tr><td>Employee ID= "+doBean.getEmpID()+ "</tr></td>");
            out.println("<tr><td><input type ='text' name ='Uname' value ="+doBean.getEmpName()+ "></tr></td>");
            out.println("<tr><td><input type ='text' name ='Usalary' value ="+doBean.getEmpSalary()+ "></tr></td>");
            out.println("<tr><td><input type ='text' name ='Ugender' value ="+doBean.getEmpGender()+ "></tr></td>");
            out.println("<tr><td><input type='submit' value='update'></tr></td>");
            out.println("</table>");
            out.println("</div>");
            }
          
    %>
       <script>
            //update() function script...
            function update(){
                document.getElementById("inserting").innerHTML="Enter the ID:-";
            var op= document.getElementById("operations");
            var uform = document.createElement('form');
            uform.method='post';
            var textFil= document.createElement('input');
            textFil.name='UPID';
            textFil.type='text';
            var sub = document.createElement('input');
            sub.type='submit';
            sub.name='updateSubmit';
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
                    
                    double ds = Double.parseDouble(s);
                    
                    //doBean.setEmpID(uid);
                    doBean.setEmpGender(g);
                    doBean.setEmpName(n);
                    doBean.setEmpSalary(ds);
                    System.out.println("Im here now------------------->>");
                    if(doBean.update(id)){
                     out.println("<script>document.getElementById(\"result\").innerHTML=\"Updated Employee:- "+doBean.getEmpName()+"\"</script>");   
                    }
                    }
                       
    %>
    <script>
        function del(){
            var inst = document.getElementById('inserting');
            inst.innerHTML="Enter the ID you want to delete:- ";
            var op = document.getElementById('operations');
            var dform = document.createElement('form');
            dform.method='post';
            var textFil= document.createElement('input');
            textFil.name='DID';
            textFil.type='text';
            var sub = document.createElement('input');
            sub.type='submit';
            sub.value='Delete';
            dform.appendChild(textFil);
            dform.appendChild(sub);
            var opChildren = op.childNodes;
            
            if(opChildren[0]){
                op.replaceChild(dform,opChildren[0]);
            }
            else
                op.appendChild(dform);
            
        };
       
    </script>
              
   <%
       //deleting.........>
       i = request.getParameter("DID");
       
       if(i!=null){
           int did = Integer.parseInt(i);
           doBean=EmpDAO.display(did);
           System.out.println("Got deleteID!"+doBean.getEmpID());
           String name = doBean.getEmpName();
           if(doBean.delete(did)){
               System.out.println("Deleted---------------------->");
               out.println("<script>document.getElementById(\"result\").innerHTML=\"Deleted Employee:- "+did+"\"</script>");
               doBean.setEmpID(0);
           }
       }
       System.out.println(doBean.getEmpID());
       
       
   %>
   <script>
       function display(){
           
            var inst = document.getElementById('inserting');
            inst.innerHTML="Enter the ID Or type All:- ";
            var op = document.getElementById('operations');
            var diform = document.createElement('form');
            diform.method='post';
            var textFil= document.createElement('input');
            textFil.name='DiID';
            textFil.type='text';
            var sub = document.createElement('input');
            sub.type='submit';
            sub.value='Display';
            sub.name="gg";
            diform.appendChild(textFil);
            diform.appendChild(sub);
            var opChildren = op.childNodes;
            
            if(opChildren[0]){
                op.replaceChild(diform,opChildren[0]);
            }
            else
                op.appendChild(diform);
            
            
        
       };
   </script>
   <%
       i = request.getParameter("DiID");
            System.out.println("I have the Display ID---------------->"+i);
            if(i!=null){
            if(!i.equalsIgnoreCase("all")){
                id = Integer.parseInt(i);
                doBean = EmpDAO.display(id);
                out.println("<script>document.getElementById('result').innerHTML=\""+doBean+"\"</script>");
            }
              else if(i.equalsIgnoreCase("All")){               
               Iterator itr = doBean.displayAll().iterator();
               if(itr.hasNext()){
               out.println("<table border='1' id='xtab'>");
               out.println("<tr><th>ID</th><th>NAME</th><th>SAL</th><th>GENDER</th></tr>");
                while(itr.hasNext()){
                    doBean = (EmpDAO)itr.next();
                    
                    if(doBean.getEmpID()!=0){
                        out.println("<tr><td>"+doBean.getEmpID()+"</td><td>"+doBean.getEmpName()+"</td><td>"+doBean.getEmpSalary()+"</td><td>"+doBean.getEmpGender()+"</td></tr>");
                    }                    
                }
                out.println("</table>");
               
            }
            }
            }
   %>