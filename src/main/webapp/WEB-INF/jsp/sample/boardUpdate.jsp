<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
<form id="frm">
    <table class="board_view">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <caption>�Խñ� ��</caption>
        <tbody>
            <tr>
                <th scope="row">�� ��ȣ</th>
                <td>
                    ${map.idx }
                    <input type="hidden" id="IDX" name="IDX" value="${map.idx }">
                </td>
                <th scope="row">��ȸ��</th>
                <td>${map.hit_cnt }</td>
            </tr>
            <tr>
                <th scope="row">�ۼ���</th>
                <td>${map.crea_id }</td>
                <th scope="row">�ۼ��ð�</th>
                <td>${map.crea_dtm }</td>
            </tr>
            <tr>
                <th scope="row">����</th>
                <td colspan="3">
                    <input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${map.title }"/>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="view_text">
                    <textarea rows="20" cols="100" title="����" id="CONTENTS" name="CONTENTS">${map.contents }</textarea>
                </td>
            </tr>
        </tbody>
    </table>
</form>
<a href="#this" class="btn" id="list">�������</a>
<a href="#this" class="btn" id="update">�����ϱ�</a>
<a href="#this" class="btn" id="delete">�����ϱ�</a>
 
<%@ include file="/WEB-INF/include/include-body.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
        $("#list").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_openBoardList();
        });
         
        $("#update").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_updateBoard();
        });
         
        $("#delete").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_deleteBoard();
        });
    });
     
    function fn_openBoardList(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
        comSubmit.submit();
    }
     
    function fn_updateBoard(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/sample/updateBoard.do' />");
        comSubmit.submit();
    }
     
    function fn_deleteBoard(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
        comSubmit.addParam("IDX", $("#IDX").val());
        comSubmit.submit();
         
    }
</script>
</body>
</html>