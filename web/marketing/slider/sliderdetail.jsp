<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi ti?t Slider</title>
</head>
<body>
    <h2>Chi ti?t Slider</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <td>${slider.id}</td>
        </tr>
        <tr>
            <th>Ti�u ??</th>
            <td>${slider.title}</td>
        </tr>
        <tr>
            <th>H�nh ?nh</th>
            <td><img src="${slider.image}" width="300"></td>
        </tr>
        <tr>
            <th>Li�n k?t ng??c</th>
            <td>${slider.backlink}</td>
        </tr>
        <tr>
            <th>Tr?ng th�i</th>
            <td>${slider.status}</td>
        </tr>
        <tr>
            <th>Ghi ch�</th>
            <td>${slider.note}</td>
        </tr>
        <tr>
            <th>Ng�y t?o</th>
            <td>${slider.createdAt}</td>
        </tr>
        <tr>
            <th>Ng�y c?p nh?t</th>
            <td>${slider.updatedAt}</td>
        </tr>
    </table>
    <br>
    <a href="/marketing/sliderList">Quay l?i danh s�ch</a>
</body>
</html>