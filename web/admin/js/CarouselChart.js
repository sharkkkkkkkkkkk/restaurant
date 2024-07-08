
const dropArea = document.getElementById('drop-area');
const inputFile = document.querySelector('input[type="file"]');
const preview = document.getElementById('preview');
// 阻止默认拖放行为
dropArea.addEventListener('dragover', (e) => {
    e.preventDefault();
    dropArea.style.backgroundColor = '#f0f0f0';
});

dropArea.addEventListener('dragleave', () => {
    dropArea.style.backgroundColor = '';
});

// 处理拖放事件
dropArea.addEventListener('drop', (e) => {
    e.preventDefault();
    dropArea.style.backgroundColor = '';

    const file = e.dataTransfer.files[0];
    if (file) {
        // 处理拖放的文件
        console.log('拖放的文件：', file.name);
        // 将文件信息填充到 input 元素中
        inputFile.files = e.dataTransfer.files;

        //图片显示
        if (file) {
            // 创建一个 FileReader 对象来读取文件内容
            const reader = new FileReader();
            reader.onload = (e) => {
                // 将文件内容设置为图片的 src 属性，实现实时预览
                preview.src = e.target.result;
                preview.style.display = 'block'; // 显示图片

            };
            reader.readAsDataURL(file); // 读取文件内容
        }
    }
});
