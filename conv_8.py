import os

gt_dir = "C:\\Users\\ASUS\\Documents\\model\\mm_sentence_ocr\\uncleaned\\gt"

for gt_file in os.listdir(gt_dir):
    if gt_file.endswith(".txt"):
        gt_path = os.path.join(gt_dir, gt_file)

        with open(gt_path, "rb") as f:
            raw_data = f.read()

        try:
            text = raw_data.decode("utf-8")
            print(f"Already UTF-8: {gt_file}")
        except UnicodeDecodeError:
            try:
                text = raw_data.decode("utf-8")
                print(f"Already UTF-8: {gt_file}")
            except UnicodeDecodeError:
                try:
                    text = raw_data.decode("utf-16")
                    print(f"Converted from UTF-16: {gt_file}")
                except UnicodeDecodeError:
                    text = raw_data.decode("cp1252", errors="replace")
                    print(f"Converted from ANSI: {gt_file}")
            
        with open(gt_path, "w", encoding="utf-8") as f:
            f.write(text)

print("All text files converted to UTF-8 successfully!")