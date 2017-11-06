<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Core JS -->
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
$('.target').change(function() { alert('Handler for .change() called.'); });
</script>
</head>
<body>

<form> <input class="target" type="text" value="Field 1" /> <select class="target"> <option value="option1" selected="selected">Option 1</option> <option value="option2">Option 2</option> </select> </form> <div id="other"> Trigger the handler </div>

</body>
</html>