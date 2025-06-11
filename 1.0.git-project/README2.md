# Part 3: Merging Changes

Now that both Tom and Jerry have made their contributions in separate branches, it's time to review and merge these changes into the main project.

## 1. Creating a Pull Request (PR)

### For Tom's Changes (update-navigation branch):

1. Go to your GitHub repository in a web browser
2. You should see a notification about recently pushed branches with an option to "Compare & pull request"

   ![Compare & Pull Request](img/placeholder-pr-notification.png) <!-- Replace with actual image -->

3. Click on "Compare & pull request"
4. Add a title and description explaining the changes (e.g., "Update website navigation")
5. Click "Create pull request"

   ![Create Pull Request](img/placeholder-create-pr.png) <!-- Replace with actual image -->

6. Repeat the same process for Jerry's changes (add-contact-info branch)

## 2. Reviewing and Merging Pull Requests

### Reviewing Changes:

1. Click on the "Pull requests" tab in your GitHub repository
2. Select the PR you want to review (e.g., "Update navigation")
3. Review the changes in the "Files changed" tab

   ![Review Changes](img/placeholder-review-changes.png) <!-- Replace with actual image -->

4. If everything looks good, you can add a comment and approve the PR

### Merging the PR:

1. After approval, click the "Merge pull request" button
2. Add a merge message (or keep the default)
3. Click "Confirm merge"
4. You'll see a message confirming the merge was successful
5. Click "Delete branch" to clean up (optional but recommended)

   ![Merge Successful](img/placeholder-merge-success.png) <!-- Replace with actual image -->

## 3. Handling Merge Conflicts (if any)

If both Tom and Jerry modified the same parts of the same files, you might encounter merge conflicts:

1. When trying to merge the second PR, GitHub will show a message about merge conflicts
2. Click "Resolve conflicts"
3. In the conflict resolution editor:
   - Look for the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
   - Edit the file to resolve the conflicts
   - Keep the changes you want, remove the conflict markers

   ![Resolve Conflicts](img/placeholder-resolve-conflicts.png) <!-- Replace with actual image -->

4. Click "Mark as resolved"
5. Click "Commit merge"
6. Now you can merge the PR as described in the previous section

## 4. Updating Your Local Repository

After merging changes on GitHub, update your local repository:

1. Switch to the main branch:
   ```
   git checkout main
   ```

2. Pull the latest changes:
   ```
   git pull origin main
   ```

3. Delete the local branches that have been merged (optional but recommended):
   ```
   git branch -d update-navigation
   git branch -d add-contact-info
   ```

## 5. Verifying the Merged Changes

1. Open the `index.html` file in your text editor
2. You should see both Tom's and Jerry's changes combined
3. You can also view the commit history to see how the project evolved:
   ```
   git log --oneline --graph --all
   ```

   ![Git Log](img/placeholder-git-log.png) <!-- Replace with actual image -->

## Conclusion

Congratulations! You've successfully:
1. Created and worked with multiple branches
2. Made changes in isolation
3. Created pull requests for code review
4. Merged changes into the main branch
5. Handled merge conflicts (if any occurred)

This workflow is fundamental to collaborative software development and will be used extensively in your DevOps journey.

---

**Note to user:** Please replace the placeholder image paths with your actual screenshots when available. The suggested image names indicate what each image should represent.