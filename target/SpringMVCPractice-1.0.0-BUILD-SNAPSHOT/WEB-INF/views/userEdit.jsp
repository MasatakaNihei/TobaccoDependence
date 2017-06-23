<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored ="false" %>
<%@taglib prefix = "c" uri ="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザー編集</title>
</head>
<body>
<form action="userEdit" method ="post">
			<table>
			<tr>
			<th>
			<input type ="hidden" name ="id" value ="${targetUser.id }">
			名前
			</th>
			<td>
			<input type ="text" name ="name" value="${targetUser.name }"><br>
			</td>
			</tr>
			<tr>
			<th>
			ログイン
			</th>
			<td><input type ="text" name ="loginId" value="${targetUser.loginId }"><br>
			</td>
			</tr>
			<tr>
			<th>
			パスワード
			</th>
			<td><input type ="password" name="password"><br>
			</td>
			<td class ="right">
			(空白の場合は変更しません)
			</td>
			</tr>
			<tr>
			<th>
			パスワード(確認用)
			</th>
			<td>
			<input type ="password" name ="confPassword"><br>
			</td>
			</tr>
			
			
			<tr>
			<th>
			支店
			</th>
			<td>
			<c:if test="${targetUser.id == loginUser.id }" var = "isLoginUser">
			</c:if>
			<c:if test="${isLoginUser }">
				<input type ="hidden" name ="branchId" value ="">
				※自分の支店は編集はできません※<br>
			</c:if>	
			<c:if test="${not isLoginUser }">
				<c:if test="${sessionScope.oldBranchId == null }">
					<c:set var = "oldBranchId" value ="${targetUser.branchID }" scope ="session"></c:set>
				</c:if>
				<select name ="branchId" class ="branch" id ="${oldBranchId }">
					<option value = "${oldBranchId }" selected >変更しない</option>
					<c:forEach items ="${requestScope.branchList}" var = "branch">
						<c:if test="${!branch.getId().equals(oldBranchId) }">
							<option value = ${branch.id }><c:out value="${branch.name}"></c:out></option>
						</c:if>
					</c:forEach>
				</select><br>
			</c:if>
			</td>
			<td class ="right">
			(現在：<c:out value="${targetUser.branchName }"></c:out>)
			</td>
			</tr>
			<tr>
			<th>
			部署・役職
			</th>
			<td>
			<c:if test="${isLoginUser }">
				<input type ="hidden" name ="positionId" value ="">
				※自分の部署・役職は編集できません※<br>
			</c:if>
			<c:if test="${not isLoginUser }">
				<c:if test="${sessionScope.oldPositionId == null }">
					<c:set var = "oldPositionId" value ="${targetUser.positionId }" scope ="session"/>
				</c:if>
				<select  name ="positionId"  class = "position" id ="${oldPositionId }">	
					<option value = "${oldPositionId }" class = "${oldBranchId}" selected >変更しない</option>
					<c:forEach items ="${branchList }" var ="branch">
						<c:if test="${positionMap.containsKey(branch.getId()) }">
							<c:if test="${!oldPositionId.equals('0') }">
								<option value = 0 class = "${branch.id }">なし</option>
							</c:if>
							<c:forEach items ="${positionMap[branch.id]}" var ="position">
								<c:if test="${!position.getId().equals(oldPositionId) }">
									<option value = "${position.id}" class = "${branch.id }"><c:out value="${position.name }"></c:out></option>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${!positionMap.containsKey(branch.getId()) }">
							<c:forEach items = "${positionMap['0'] }" var ="position">
								<c:if test="${!position.getId().equals(oldPositionId) }">
									<option value ="${position.id }" class ="${branch.id }"><c:out value="${position.name }"></c:out></option>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
			</select><br>
			</c:if>
			</td>
			<td class ="right">
			(現在：<c:out value="${targetUser.positionName }"></c:out>)
			</td>
			</tr>
			<tr>
			<td colspan="3">
			<input type ="submit" class ="bottun" value ="編集を確定"/>
			</td>
			</tr>
			</table>
		</form>
</body>
</html>