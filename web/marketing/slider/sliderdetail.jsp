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
            <th>Tiêu ??</th>
            <td>${slider.title}</td>
        </tr>
        <tr>
            <th>Hình ?nh</th>
            <td><img src="${slider.image}" width="300"></td>
        </tr>
        <tr>
            <th>Liên k?t ng??c</th>
            <td>${slider.backlink}</td>
        </tr>
        <tr>
            <th>Tr?ng thái</th>
            <td>${slider.status}</td>
        </tr>
        <tr>
            <th>Ghi chú</th>
            <td>${slider.note}</td>
        </tr>
        <tr>
            <th>Ngày t?o</th>
            <td>${slider.createdAt}</td>
        </tr>
        <tr>
            <th>Ngày c?p nh?t</th>
            <td>${slider.updatedAt}</td>
        </tr>
    </table>
    <br>
    <a href="/marketing/sliderList">Quay l?i danh sách</a>
</body>
</html>