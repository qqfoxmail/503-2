

from time import sleep


while True:
    sleep(3)
    print("-------test")


# screen中conda使用

# conda deactivate
# 1 首先退出环境

# screen -R name
# 2 创建你的screen环境

# screen -list
# 新开终端查看screen id

# 4 恢复运行环境

# screen -r id

# 清除screen环境
# screen -D
# kill -9 id
# screen -wipe