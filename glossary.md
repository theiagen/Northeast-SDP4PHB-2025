# Development Terms 

## Design Documents & Dev Environments

- ### Design Document
    Document used to outline a development problem and a proposed solution
- ### Development Environment
    Separate space for testing and developing code. Keeps bugs and issues isolated from production code.
- ### Version Control
    Systems to handle tracking and saving of code changes over time.
- ### Git / GitHub
    Version control software (VCS) for managing code repositories as well as hosting said repositories.

## GitHub / Version Control

- ### Stage
    Prep changes for a commit. This allows you to pick and choose changes for a given commit.
- ### Commit
    A snapshot of your repository at a given time. Like a save point.
- ### Push
    Move any commits/changes to a remote repository.
- ### Pull
    Transition code from a remote repository to a local instance, be it Docker, GitHub, or any other remote repository. Allows others to utilize your pushed changes.
- ### Merge
    Incorporate changes made on one branch into another, usually from a development branch into the main branch.
- ### Synchronize
    Involves processes such as git fetch, pull, and push that keeps local and remote branches in concordance with one another.
- ### Publish
    Publishing involves the committing and pushing of changes to a remote repository.
- ### Clone
    Copies a remote repository into a directory on a local instance. This includes the ability to view branches and previous commits. 

## Changes to Production

- ### Functional Test
    Testing that the code changes functions correctly in likely scenarios.
- ### Validation Test
    Ensure software meets very specific criteria like a previously defined benchmark
- ### Continuious Integration (CI)
    Frequent contribution of code to a central repository from which automates builds and tests are run.
- ### User Acceptance Testing (UAT)
    The approval by end-users that the software meets needs and expectations.
- ### Static Release
    A deployment of a fixed software version that does not recieve changes regularly.
- ### Semantic Versioning
    A versioning scheme that reflects the severity of changes made to a codebase. 

## Workflow Managers and Nextflow

- ### Software Package
    A bundle of related computational resources that are required for certain pieces of software to function.
- ### Package Manager
    Allows for ease of installation/update of software packages. 
- ### Workflow Manager
    Handle the execution and operation of workflow code within a standardized framework for reproducibility. 
- ### Workflow Language
    The script that is executed by a workflow engine.
- ### Workflow Engine
    Software that interpretes and executes workflow script.
- ### First In First Out (FIFO)
    The order in which data can enter and exit a data structure, specifically Nextflow Channels.