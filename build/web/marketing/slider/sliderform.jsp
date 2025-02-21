<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Slider</title>
</head>
<body>
    <h2>Thêm Slider M?i</h2>
    <form action="/marketing/addSlider" method="post" enctype="multipart/form-data">
        <label for="title">Tiêu ??:</label>
        <input type="text" id="title" name="title" required><br>
        
        <label for="image">Hình ?nh:</label>
        <input type="file" id="image" name="image" accept="image/*" required><br>
        
        <label for="backlink">Liên k?t ng??c:</label>
        <input type="text" id="backlink" name="backlink"><br>
        
        <label for="status">Tr?ng thái:</label>
        <select id="status" name="status">
            <option value="active">Hi?n th?</option>
            <option value="inactive">?n</option>
        </select><br>
        
        <label for="note">Ghi chú:</label>
        <textarea id="note" name="note"></textarea><br>
        
        <button type="submit">Thêm Slider</button>
    </form>
</body>
</html>
