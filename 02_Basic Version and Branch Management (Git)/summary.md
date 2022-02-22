# (2) Basic Version and Branch Management (Git)

## Resume
Dalam materi ini saya mempelajari : 
1. Git
2. Setting up
3. Branches

### 💡 Apa itu Git ?
Git adalah perangkat lunak `version control` atau proyek manajemen kode perangkat lunak yang diciptakan oleh Linus Torvalds (2005).
Git sendiri merupakan salah satu version control system populer yang digunakan para developer untuk mengembangkan software secara bersama - sama. 

      Version control merupakan suatu sistem pengelolaan berbagai versi atau revisi atas perubahan suatu berkas sehingga kita dapat 
      mengatur untuk kembali ke versi sebelumnya atau sesudahnya.
      
Disini saya menggunakan Github untuk sinkronis versioning dan juga repository-nya.
      
### 💡 Setting Up
- git config yaitu mengkonfigurasikan user ke git.
- git clone yaitu mengkloning repository di github ke dalam lokal directory sekaligus dapat meremotenya.
- git add merupakan menambahkan file baru ke repository yang dipilih.
- git commit yaitu untuk menyimpan perubahan yang dilakukanm tetapi tidak ada perubahan pada repository-nya.
- git push yaitu untuk mengirim perubahan file setelah di commit ke dalam repository.
- git diff yaitu perintah untuk memberitahu perubahan apa saja yang terjadi di file.
- git stash merupakan tempat menyimpan semua kode yang belum selesai dikerjakan untuk di commit.
- git pull / fetch merupakan perintah untuk mengambil file yang terbaru dari repository.
- git remote yaitu  petunjuk ke versi repositori yang biasanya disimpan di server lain.

### 💡 Branches
Sebuah branch / cabang di Git secara sederhana hanyalah pointer yang dapat bergerak ke salah satu commit.

Cara membuat branch baru yaitu `git branch (nama branch)` lalu untuk mengecek brench apa saja yang terdaftar yaitu `git branch --list`, setelah itu kita daftarkan branch baru tersebut ke dalam repository yang ada di github dengan cara `git push -u origin (nama branch)`, dan cara untuk berpindah ke suatu branch untuk mengecek commit disetiap branch yaitu `git checkout (nama branch)` atau `git switch (nama branch)`.

selanjutnya jika kita ingin menggabungkan setiap commit pada masing masing branch yaitu dengan cara `git merge (nama branch)` tetapi sebelum itu ganti branch kita yang dimana commitannya ingin kita gabungkan oleh commit dari branch lain.

## Task
### 1. Membuat 4 branch
Pada task ini saya membuat 4 branch dengan nama master(default), developer, feature1, dan feature2
https://github.com/Naufal-Ulwan/latihan/network
Output : 
