import tkinter as tk
import subprocess

PROJECT_DIR = r"C:\Gowin\Gowin_V1.9.11.03_Education_x64\IDE\bin\Documents\VGA_gen"  # <- ZMIEŃ NA SWÓJ FOLDER

def upload():
    subprocess.run("git add .", cwd=PROJECT_DIR, shell=True)
    subprocess.run('git commit -m "FPGA update via GUI"', cwd=PROJECT_DIR, shell=True)
    subprocess.run("git push", cwd=PROJECT_DIR, shell=True)

def rollback():
    subprocess.run("git log --oneline -10", cwd=PROJECT_DIR, shell=True)
    commit = input("Wklej hash commita: ")
    subprocess.run(f"git checkout {commit}", cwd=PROJECT_DIR, shell=True)

root = tk.Tk()
root.title("FPGA Git Panel")
root.geometry("300x150")

btn1 = tk.Button(root, text="🚀 Upload FPGA", command=upload, height=2, width=25)
btn1.pack(pady=10)

btn2 = tk.Button(root, text="↩ Rollback", command=rollback, height=2, width=25)
btn2.pack(pady=10)

root.mainloop()