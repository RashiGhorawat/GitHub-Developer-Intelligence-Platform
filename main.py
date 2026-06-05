import requests
import pandas as pd
import time

languages = [
    "Python",
    "Java",
    "JavaScript",
    "Go",
    "C++"
]

all_data = []

for language in languages:

    print(f"Collecting {language} repositories...")

    for page in range(1, 3):  # pages 1 and 2

        url = f"https://api.github.com/search/repositories?q=language:{language}&sort=stars&per_page=100&page={page}"

        response = requests.get(url)

        if response.status_code != 200:
            print(f"Error for {language} page {page}")
            continue

        data = response.json()

        for repo in data["items"]:

            all_data.append({
                "name": repo["name"],
                "language": repo["language"],
                "stars": repo["stargazers_count"],
                "forks": repo["forks_count"],
                "owner": repo["owner"]["login"],
                "created_at": repo["created_at"]
            })

        print(f"Page {page} completed")

        time.sleep(1)  # avoid hitting rate limits

df = pd.DataFrame(all_data)

print("Total rows:", len(df))

df.to_csv("github_1000_repos.csv", index=False)

print("CSV Created Successfully")