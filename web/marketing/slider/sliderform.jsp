<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Th�m Slider</title>
</head>
<body>
    <h2>Th�m Slider M?i</h2>
    <form action="/marketing/addSlider" method="post" enctype="multipart/form-data">
        <label for="title">Ti�u ??:</label>
        <input type="text" id="title" name="title" required><br>
        
        <label for="image">H�nh ?nh:</label>
        <input type="file" id="image" name="image" accept="image/*" required><br>
        
        <label for="backlink">Li�n k?t ng??c:</label>
        <input type="text" id="backlink" name="backlink"><br>
        
        <label for="status">Tr?ng th�i:</label>
        <select id="status" name="status">
            <option value="active">Hi?n th?</option>
            <option value="inactive">?n</option>
        </select><br>
        
        <label for="note">Ghi ch�:</label>
        <textarea id="note" name="note"></textarea><br>
        
        <button type="submit">Th�m Slider</button>
    </form>
</body>
</html>
