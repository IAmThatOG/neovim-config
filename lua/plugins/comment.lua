local setup, comment = pcall(require, "Comment")

if not setup then
    print("Comment plugin not setup")
    return
end

comment.setup()
